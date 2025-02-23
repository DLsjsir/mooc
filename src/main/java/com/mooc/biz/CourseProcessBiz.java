package com.mooc.biz;

import com.mooc.entity.CourseProcess;
import java.util.List;

/**
 * @Description
 * @Author Sea
 * @Date 2025/2/23 16:53
 **/
public interface CourseProcessBiz {

    // 查询所有课程进度
    List<CourseProcess> selectAllCourseProcesses();

    // 插入课程进度
    void insertCourseProcess(CourseProcess courseProcess);

    // 根据主键更新课程进度
    void updateCourseProcess(CourseProcess courseProcess);

    // 根据课程ID和用户ID查询课程进度
    CourseProcess selectCourseProcessByCourseIdAndUserId(int courseid, String userid);
}
