package com.mooc.controller;

import com.mooc.biz.CourseProcessBiz;
import com.mooc.entity.CourseProcess;
import com.mooc.mapper.CourseProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {

    @Autowired
    private CourseProcessBiz courseProcessBiz;

    @MessageMapping("/updateLearningTime")
    @SendTo("/topic/learningTime")
    public String updateLearningTime(CourseProcess courseProcess) {
        // 根据课程ID和用户ID查询课程进度
        CourseProcess existingProcess = courseProcessBiz.selectCourseProcessByCourseIdAndUserId(courseProcess.getCourseid(), courseProcess.getUserid());
        if (existingProcess != null) {
            // 更新学习时间
            existingProcess.setLearntime(existingProcess.getLearntime() + courseProcess.getLearntime());
            courseProcessBiz.updateCourseProcess(existingProcess);
        }else {
            // 插入新的课程进度
            courseProcessBiz.insertCourseProcess(courseProcess);
        }
        return "Learning time updated for course: " + courseProcess.getCourseid() + ", user: " + courseProcess.getUserid();
    }
}
