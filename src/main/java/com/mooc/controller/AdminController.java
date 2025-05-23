package com.mooc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
   







import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mooc.biz.*;
import com.mooc.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mooc.util.DateUtil;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	UserBiz userBiz;
	@Autowired
	LogBiz logBiz;
	@Autowired
	CourseBiz courseBiz;
	@Autowired
	IpsetBiz ipsetBiz;
	@Autowired
	MessageBiz messageBiz;
	@Autowired
	ReportBiz reportBiz;
	public void setlog(User loginUser,String ip,String type,String adminname){
		Log log = new Log();
		log.setUserid(loginUser.getId());
		log.setUsername(loginUser.getUsername());
		log.setIp(ip);
		log.setType(type);
		log.setExecutor(adminname);
		logBiz.insert(log);
	}
	
	@RequestMapping(value = "adminindex")
	public String adminindex(HttpSession session){
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())&&!"teacher".equals(loginUser.getMission())){
			//添加管理员的再次验证
		session.setAttribute("loginUser", loginUser);
		return "redirect:course";
		}
		return "admin/adminindex";
	}
	
	
	@RequestMapping(value = "adminlogin")//管理员登录
	public String adminlogin(User user, HttpSession session,HttpServletRequest req) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		User loginUser = userBiz.selectLoginUser(paramMap);
		if (loginUser == null) {
			return "login"; 
		}else if("teacher".equals(loginUser.getMission())){
			session.setAttribute("loginUser", loginUser);
			setlog(loginUser, req.getRemoteAddr(),"登录", loginUser.getUsername());
			return "admin/teacherleftmenu";
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员登录的再次验证，防止直接跳过前端验证进行强制登录
		session.setAttribute("loginUser", loginUser);
		Log log = new Log();
		log.setUserid(loginUser.getId());
		log.setUsername(loginUser.getUsername());
		log.setIp(req.getRemoteAddr());
		log.setType("用户尝试强制登录管理员页面");
		logBiz.insert(log);
		return "redirect:course";
		} else{
		session.setAttribute("loginUser", loginUser);
		setlog(loginUser, req.getRemoteAddr(),"登录", loginUser.getUsername());
		return "admin/leftmeun";

		}
	}
	@RequestMapping(value = "alluser")//展示所有用户
	public ModelAndView alluser(ModelAndView mav, int page, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("login");
			return mav;
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			mav.setViewName("redirect:course");
			return mav;
		}else{
			List<User> userss = userBiz.selectAllUser();
			int totalpage = 14;//一页的数量
			List<User> users = new ArrayList<User>();
			mav.addObject("maxpage", (userss.size()-1)/totalpage);
			for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
				if(userss.size()==i){
					mav.addObject("users", users);
					mav.addObject("page", page);
					mav.setViewName("admin/alluser");
					return mav;
				}
				users.add(userss.get(i));
			}
			mav.addObject("page", page);
			mav.addObject("loginUser", loginUser);
			mav.addObject("users", users);
			mav.setViewName("admin/alluser");
		    return mav;
		
		}
	}
	@RequestMapping(value = "banuser")//屏蔽和恢复用户
	public String banuser(String userid,int type, HttpSession session,HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())){
			//添加管理员的再次验证
		session.setAttribute("loginUser", loginUser);
		return "redirect:course";
		}else{
			if(type==0){//0为屏蔽用户
				User user = userBiz.selectByPrimaryKey(userid);
				user.setBuycase("1");
				userBiz.updateByPrimaryKeySelective(user);
				setlog(user,req.getRemoteAddr(),"屏蔽用户登录",loginUser.getUsername());
				return "redirect:alluser?page=0";
			}
			if(type==1){//1为恢复用户
				User user = userBiz.selectByPrimaryKey(userid);
				user.setBuycase("0");
				user.setScore(100);
				userBiz.updateByPrimaryKeySelective(user);
				setlog(user,req.getRemoteAddr(),"恢复用户登录",loginUser.getUsername());
				return "redirect:alluser?page=0";
			}
		
		}
		return "redirect:alluser?page=0";
	}
	@RequestMapping(value = "rechargeindex")//充值余额界面
	public String rechargeindex( HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		return "admin/recharge";
	}
	@RequestMapping(value = "recharge")//充值余额
	public void recharge(String userid,int collect, String paypassword,HttpServletRequest req,
			HttpSession session,HttpServletResponse resp) throws IOException {
		User loginUser = (User) session.getAttribute("loginUser");
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		User user = userBiz.selectByPrimaryKey(userid);
		if(user==null){
			pw.print("用户ID不存在！请核实后再充值");
		}else if(!paypassword.equals("591284209")){
			pw.print("0");
		}else{
			user.setCollect(user.getCollect()+collect);
			userBiz.updateByPrimaryKeySelective(user);
			setlog(user,req.getRemoteAddr(),"充值"+collect+"元",loginUser.getUsername());
			pw.print("账户"+userid+",充值"+collect+"元成功，余额："+user.getCollect());
		}
	}
	@RequestMapping(value = "newuser")//新建用户界面，用户详情界面
	public String newuser(String userid, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		if(userid!=null){
			User user = userBiz.selectByPrimaryKey(userid);
			session.setAttribute("user", user);
			return "admin/newuser";
		}else{
			session.removeAttribute("user");
			return "admin/newuser";
		}
	}
	@RequestMapping(value = "newadduser")//新建账户
	public String newadduser(User newuser,HttpSession session,HttpServletRequest req){
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}else if(!"admin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			return "redirect:course";
		}
		newuser.setId(DateUtil.getId());
		userBiz.insertSelective(newuser);
		setlog(newuser,req.getRemoteAddr(),"创建用户",loginUser.getUsername());
		return "redirect:newuser";
	}
	@RequestMapping(value = "setuser")//修改账户
	public String setuser(User user,HttpSession session,HttpServletRequest req){
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}else if(!"admin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			return "redirect:course";
		}
		user.setCollect(userBiz.selectByPrimaryKey(user.getId()).getCollect());
		userBiz.updateByPrimaryKeySelective(user);
		setlog(user,req.getRemoteAddr(),"修改用户信息",loginUser.getUsername());
		return "redirect:alluser?page=0";
	}
	@RequestMapping(value = "removeuser")//删除用户
	public void removeuser(String userid,String removepassword,HttpSession session,HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		User loginUser = (User) session.getAttribute("loginUser");
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		if(!removepassword.equals("591284209")){
			pw.print("0");
		}else{
			User user = userBiz.selectByPrimaryKey(userid);
			userBiz.deleteByPrimaryKey(userid);
			setlog(user,req.getRemoteAddr(),"删除用户",loginUser.getUsername());
			pw.print("账户："+userid+",删除成功");
			List<User> users = userBiz.selectAllUser();
			session.setAttribute("users", users);
		}
	}
	@RequestMapping(value = "showlog")//日志查看
	public String showlog(String seachusername,String type, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		List<Log> logs;
		if(seachusername!=null&&type==null){
			logs = logBiz.selectbyusername(seachusername);
			session.setAttribute("logss", logs);
			session.removeAttribute("type");
			session.setAttribute("logs", initlogpage(logs));
			session.setAttribute("maxpage", (logs.size()-1)/15);//10为每页个数
			session.setAttribute("page", 0);
			return "admin/log";
		}
		if(type!=null&&seachusername==null){
			logs = logBiz.selectadminlog();
			session.setAttribute("type", "admin");
			session.setAttribute("logss", logs);
			session.setAttribute("logs", initlogpage(logs));
			session.setAttribute("maxpage", (logs.size()-1)/15);
			session.setAttribute("page", 0);
			return "admin/log";
		}
		if(type==null){
			logs = logBiz.select();
			session.removeAttribute("type");
		    session.setAttribute("logss", logs);
		    session.setAttribute("logs", initlogpage(logs));
		    session.setAttribute("maxpage", (logs.size()-1)/15);
		    session.setAttribute("page", 0);
		    return "admin/log";
		} else {
		    logs = logBiz.selectadminlogbyusername(seachusername);
			session.removeAttribute("type");
		    session.setAttribute("logss", logs);
		    session.setAttribute("logs", initlogpage(logs));
		    session.setAttribute("maxpage", (logs.size()-1)/15);
		    session.setAttribute("page", 0);
		    return "admin/log";
		}
	}
	
	public List<Log> initlogpage(List<Log> logss){//第一次传输日志
		int totalpage = 15;//一页的数量
		List<Log> logs = new ArrayList<Log>();
		for(int i = 0;i<totalpage;i++){
			if(logss.size()==i)
				return logs;
			logs.add(logss.get(i));
		}
		return logs;
	}
	
	@RequestMapping(value = "logpage")//日志翻页
	public String  logpage(int page,HttpSession session){
		List<Log> logss = (List<Log>) session.getAttribute("logss");
		int rpage = (int) session.getAttribute("page");
		int totalpage = 15;//一页的数量
		List<Log> logs = new ArrayList<Log>();
		for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
			if(logss.size()==i){
				session.setAttribute("logs", logs);
				session.setAttribute("page", page);
				return "admin/log";
			}
			logs.add(logss.get(i));
		}
		session.setAttribute("logs", logs);
		session.setAttribute("page", page);
		return "admin/log";
	}
	
	@RequestMapping(value = "allcourse")//全部课程界面
	public String allcourseindex(int page, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())&&!"teacher".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		List<Course> coursess = courseBiz.selectAllCourse();
		int totalpage = 14;//一页的数量
		List<Course> courses = new ArrayList<Course>();
		session.setAttribute("maxpage", (coursess.size()-1)/totalpage);
		for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
			if(coursess.size()==i){
				session.setAttribute("courses", courses);
				session.setAttribute("page", page);
				return "admin/allcourse";
			}
			courses.add(coursess.get(i));
		}
		session.setAttribute("page", page);
	    session.setAttribute("courses", courses);
		return "admin/allcourse";
	}

	@RequestMapping(value = "allBooks")//全部书籍界面
	public String allbookindex(int page, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			return "redirect:allbook";
		}
		List<Course> coursess = courseBiz.selectAllBooks();
		int totalpage = 14;//一页的数量
		List<Course> courses = new ArrayList<Course>();
		session.setAttribute("maxpage", (coursess.size()-1)/totalpage);
		for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
			if(coursess.size()==i){
				session.setAttribute("courses", courses);
				session.setAttribute("page", page);
				return "admin/allbook";
			}
			courses.add(coursess.get(i));
		}
		session.setAttribute("page", page);
		session.setAttribute("courses", courses);
		return "admin/allbook";
	}
	@RequestMapping(value = "bancourse")//上下架课程
	public String bancourse(int type,int courseid, HttpSession session,HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		int page = (int) session.getAttribute("page");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())&&!"teacher".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		Course course = courseBiz.selectByPrimaryKey(courseid);
		Log log = new Log();
		log.setId(courseid);
		log.setExecutor(loginUser.getUsername());
		log.setIp(req.getRemoteAddr());
		if(course.getKind() .equals("0")){
			if(type==1) {//下架课程
				course.setPrice("1");
				log.setType("下架课程："+course.getName());
			}
			if(type==0) {//上架课程
				course.setPrice("0");
				log.setType("上架课程："+course.getName());
			}
			logBiz.insert(log);
			courseBiz.updateByPrimaryKeySelective(course);
			return "redirect:allcourse?page="+page;
		}else {
			if(type==1) {//下架课程
				course.setPrice("1");
				log.setType("下架课程："+course.getName());
			}
			if(type==0) {//上架课程
				course.setPrice("0");
				log.setType("上架课程："+course.getName());
			}
			logBiz.insert(log);
			courseBiz.updateByPrimaryKeySelective(course);
			return "redirect:allBooks?page="+page;
		}

	}
	
	
	@RequestMapping(value = "deletecourse")//删除课程
	public void deletecourse(int courseid, String removepassword,HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		User loginUser = (User) session.getAttribute("loginUser");
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		if(!removepassword.equals("123456")){
			pw.print("0");
		}else{
			Course course = courseBiz.selectByPrimaryKey(courseid);
			courseBiz.deleteByPrimaryKey(String.valueOf(courseid));
			Message message = new Message();
			message.setCourseid(courseid);
			messageBiz.delete(message);
			Log log = new Log();
			log.setId(courseid);
			log.setExecutor(loginUser.getUsername());
			log.setIp(req.getRemoteAddr());
			log.setType("删除课程："+course.getName());
			logBiz.insert(log);
			pw.print("课程："+course.getName()+",删除成功！请刷新页面后操作");
		}
	}
	
	@RequestMapping(value = "allip")//展示所有IP信息
	public String allip(int page, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
		session.setAttribute("loginUser", loginUser);
		return "redirect:course";
		}else{
			List<Ipset> ipss = ipsetBiz.select();
			int totalpage = 14;//一页的数量
			List<Ipset> ips = new ArrayList<Ipset>();
			session.setAttribute("maxpage", (ipss.size()-1)/totalpage);
			for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
				if(ipss.size()==i){
					session.setAttribute("ips", ips);
					session.setAttribute("page", page);
					return "admin/allip";
				}
				ips.add(ipss.get(i));
			}
			session.setAttribute("page", page);
		    session.setAttribute("ips", ips);
		    return "admin/allip";
		}
		}
	@RequestMapping(value="ipset")//ip管理
	public String ipset(HttpSession session,String ip,String onbaned){
		if(onbaned!=null) {
			Ipset ip1 = ipsetBiz.selectip(ip);
			ip1.setType("0");
			ip1.setBantime(null);
			ipsetBiz.updateByPrimaryKeySelective(ip1);
			return "redirect:allip?page=0";
		}
		
		session.setAttribute("ip", ipsetBiz.selectip(ip));
		return "admin/ipset";
	}
	@RequestMapping(value="banip")//封禁ip
	public void banip(HttpServletResponse resp,HttpSession session,String ip,String mark,String time) throws IOException{
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return ;
		}else if(!"admin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			return ;
		}
		Date date = new Date();
		Ipset ip1 = ipsetBiz.selectip(ip);
		boolean isnull = false;
		if(ip1==null) {
			ip1=new Ipset();
			ip1.setIp(ip);
			isnull =true;
		}
		ip1.setIp(ip);
		ip1.setMark(mark);
		ip1.setType("1");
		switch (time) {
			case "5m":
				if (date.getMinutes() > 55) {
					date.setMinutes(date.getMinutes() - 55);
					date.setHours(date.getHours() + 1);
				} else {
					date.setMinutes(date.getMinutes() + 5);
				}
				ip1.setBantime(date);
				break;
			case "2h":
				date.setHours(date.getHours() + 2);
				ip1.setBantime(date);
				break;
			case "1d":
				date.setDate(date.getDate() + 1);
				ip1.setBantime(date);
				break;
			case "1m":
				date.setMonth(date.getMonth() + 1);
				ip1.setBantime(date);
				break;
			case "1y":
				date.setYear(date.getYear() + 1);
				ip1.setBantime(date);
				break;
			case "ever":
				date.setYear(date.getYear() + 99);
				ip1.setBantime(date);
				break;
		}
		if(isnull) {
			ipsetBiz.insert(ip1);
		}else {
		ipsetBiz.updateByPrimaryKeySelective(ip1);
		}
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write("封禁成功！封禁至："+date);
	}
	
	@RequestMapping(value="logoutadmin")//管理员注销
	public String logoutadmin(HttpSession session,HttpServletRequest req){
		User loginUser = (User) session.getAttribute("loginUser");
		session.invalidate();
		if (loginUser == null){
			return "loginadmin";
		}
		setlog(loginUser, req.getRemoteAddr(),"注销", loginUser.getUsername());
		return "loginadmin";
	}
	@RequestMapping(value = "coursede")//课程详情界面
	public String coursede(String courseid, HttpSession session) {
		session.removeAttribute("msg");
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())&&!"teacher".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		if(courseid!=null) {
			Course course = courseBiz.selectByPrimaryKey(Integer.parseInt(courseid));
			session.setAttribute("course", course);
			return "admin/course";
		}
		if("teacher".equals(loginUser.getMission())){
			session.removeAttribute("course");
			return "admin/tcourse";
		}
		    session.removeAttribute("course");
			return "admin/course";
		
	}
	@RequestMapping(value = "coursesave")//课程上传/修改
	public String coursesave(HttpServletRequest req, HttpSession session) {
		session.removeAttribute("msg");
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login"; 
		}else if(!"admin".equals(loginUser.getMission())&&!"teacher".equals(loginUser.getMission())){
			//添加管理员的再次验证
		return "redirect:course";
		}
		courseBiz.savecourse(req);
		if("teacher".equals(loginUser.getMission())){
			session.setAttribute("msg", "操作成功");
			return "admin/tcourse";
		}else {
			session.setAttribute("msg", "操作成功");
			return "admin/course";
		}
	}

	@RequestMapping(value = "allreport")//展示所有举报信息
	public ModelAndView allreport(ModelAndView mav, int page, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("login");
			return mav;
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			mav.setViewName("redirect:course");
			return mav;
		}else{
			List<Report> reports = reportBiz.selectAll();
			int totalpage = 14;//一页的数量
			List<Report> reportList = new ArrayList<Report>();
			mav.addObject("maxpage", (reports.size()-1)/totalpage);
			for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
				if(reports.size()==i){
					mav.addObject("reports", reportList);
					mav.addObject("page", page);
					mav.setViewName("admin/allreport");
					return mav;
				}
				reportList.add(reports.get(i));
			}
			mav.addObject("page", page);
			mav.addObject("loginUser", loginUser);
			mav.addObject("reports", reportList);
			mav.setViewName("admin/allreport");
			return mav;

		}
	}

	@RequestMapping(value = "examine")//上下架课程
	public String examine(String id,int type,int page, HttpSession session,HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}else if(!"admin".equals(loginUser.getMission())&&!"showadmin".equals(loginUser.getMission())){
			//添加管理员的再次验证
			return "redirect:course";
		}
		Report report = reportBiz.selectByPrimaryKey(id);
		Log log = new Log();
		log.setId(report.getId());
		log.setExecutor(loginUser.getUsername());
		log.setIp(req.getRemoteAddr());
		if (type == 1) {//审核通过
			report.setStatus("1");
			User user = userBiz.selectByPrimaryKey(report.getUserid());
			if((user.getScore() - 10) < 60){
				user.setBuycase("1");
			}
			user.setScore(user.getScore() - 10);
			userBiz.updateByPrimaryKeySelective(user);
			log.setType("举报通过：" + report.getId());
		}
		if (type == 0) {//审核不通过
			report.setStatus("2");
			log.setType("举报不通过：" + report.getId());
		}
		logBiz.insert(log);
		reportBiz.updateByPrimaryKeySelective(report);
		return "redirect:allreport?page=" + page;
	}

}
