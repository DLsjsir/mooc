package com.mooc.biz.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.CourseBiz;
import com.mooc.entity.Course;
import com.mooc.mapper.CourseMapper;
import com.mooc.util.UploadFile;
@Service(value="CourseBiz")
public class CourseBizImpl implements CourseBiz{
	@Autowired
	CourseMapper courseMapper;
	@Override
	public List<Course> selectAllCourse() {
		// TODO Auto-generated method stub
		return courseMapper.selectAllCourse();
	}

	@Override
	public List<Course> selectAllBooks() {
		// TODO Auto-generated method stub
		return courseMapper.selectAllBooks();
	}
	@Override
	public Course selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return courseMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(Course record) {
		// TODO Auto-generated method stub
		return courseMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public List<Course> coursesearch(String search) {
		// TODO Auto-generated method stub
		return courseMapper.coursesearch(search);
	}
	@Override
	public List<Course> ageType0() {
		// TODO Auto-generated method stub
		return courseMapper.ageType0();
	}
	@Override
	public List<Course> ageType1() {
		// TODO Auto-generated method stub
		return courseMapper.ageType1();
	}

	@Override
	public List<Course> ageType2() {
		// TODO Auto-generated method stub
		return courseMapper.ageType2();
	}

	@Override
	public List<Course> ageType3() {
		// TODO Auto-generated method stub
		return courseMapper.ageType3();
	}

	@Override
	public List<Course> bookAgeType0() {
		return courseMapper.bookAgeType0();
	}

	@Override
	public List<Course> bookAgeType1() {
		return courseMapper.bookAgeType1();
	}

	@Override
	public List<Course> bookAgeType2() {
		return courseMapper.bookAgeType2();
	}

	@Override
	public List<Course> bookAgeType3() {
		return courseMapper.bookAgeType3();
	}

	@Override
	public List<Course> selectRecommendableCourse(String ageType) {
		return courseMapper.selectRecommendableCourse(ageType);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return courseMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int savecourse(HttpServletRequest req) {
		// TODO Auto-generated method stub
		int maxid = courseMapper.selectlastcourse().getId();
		Course course = (Course) UploadFile.uploadFile(String.valueOf(maxid), req);
		if(course.getId()==0) {
			course.setId(maxid+1);
			courseMapper.insertSelective(course);
			/*System.out.println(course.getId());*/
		}else {
			courseMapper.updateByPrimaryKeySelective(course);
		}
		return 0;
	}

}
