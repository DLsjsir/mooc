package com.mooc.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mooc.entity.Course;

public interface CourseBiz {
	List<Course> selectAllCourse();
    List<Course> selectAllBooks();
	Course selectByPrimaryKey(int id);
    int updateByPrimaryKeySelective(Course record);
    List<Course> coursesearch(String search);
    List<Course> ageType0();
    List<Course> ageType1();
    int deleteByPrimaryKey(String id);
    int savecourse(HttpServletRequest req);

    List<Course> ageType2();

    List<Course> ageType3();

    List<Course> bookAgeType0();

    List<Course> bookAgeType1();

    List<Course> bookAgeType2();

    List<Course> bookAgeType3();

    List<Course> selectRecommendableCourse(String ageType);
}
