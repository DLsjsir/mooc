package com.mooc.controller;

import com.mooc.biz.CourseProcessBiz;
import com.mooc.entity.CourseProcess;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description
 * @Author Sea
 * @Date 2025/2/23 16:00
 **/
@RestController
@RequestMapping("/courseprocess")
public class CourseProcessController {

    @Autowired
    private CourseProcessBiz CourseProcessBiz;

    // 获取所有课程进度
    @GetMapping
    public List<CourseProcess> getAllCourseProcesses() {
        return CourseProcessBiz.selectAllCourseProcesses();
    }

    // 根据用户ID获取课程进度
    @RequestMapping("/getcourseprocess")
    public CourseProcess getCourseProcessesByUserId(@RequestParam(name = "courseid") int courseid, @RequestParam(name = "userid") String userid) {
        return CourseProcessBiz.selectCourseProcessByCourseIdAndUserId(courseid,userid);
    }

    // 插入新的课程进度
    @PostMapping
    public void insertCourseProcess(@RequestBody CourseProcess courseProcess) {
        CourseProcessBiz.insertCourseProcess(courseProcess);
    }

    // 根据主键更新课程进度
    @PutMapping("/{id}")
    public void updateCourseProcess(@PathVariable int id, @RequestBody CourseProcess courseProcess) {
        courseProcess.setId(id);
        CourseProcessBiz.updateCourseProcess(courseProcess);
    }
}
