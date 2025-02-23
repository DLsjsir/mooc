package com.mooc.mapper;

import com.mooc.entity.CourseProcess;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface CourseProcessMapper {

    // 查询所有课程进度
    List<CourseProcess> select();

    // 根据用户ID查询课程进度
    List<CourseProcess> selectByUserId(@Param("userid") int userid);

    // 插入课程进度
    void insert(CourseProcess courseProcess);

    // 根据主键更新课程进度
    void updateByPrimaryKey(CourseProcess courseProcess);

    // 根据课程ID和用户ID查询课程进度
    CourseProcess selectByCourseIdAndUserId(@Param("courseid") int courseid, @Param("userid") String userid);
}
