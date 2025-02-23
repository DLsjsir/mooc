package com.mooc.biz.impl;

import com.mooc.biz.CourseProcessBiz;
import com.mooc.entity.CourseProcess;
import com.mooc.mapper.CourseProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @Author Sea
 * @Date 2025/2/23 16:54
 **/
@Service
public class CourseProcessImpl implements CourseProcessBiz {

    @Autowired
    private CourseProcessMapper courseProcessMapper;

    @Override
    public List<CourseProcess> selectAllCourseProcesses() {
        return courseProcessMapper.select();
    }


    @Override
    public void insertCourseProcess(CourseProcess courseProcess) {
        courseProcessMapper.insert(courseProcess);
    }

    @Override
    public void updateCourseProcess(CourseProcess courseProcess) {
        courseProcessMapper.updateByPrimaryKey(courseProcess);
    }

    @Override
    public CourseProcess selectCourseProcessByCourseIdAndUserId(int courseid, String userid) {
        return courseProcessMapper.selectByCourseIdAndUserId(courseid, userid);
    }
}
