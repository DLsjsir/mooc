package com.mooc.mapper;

import java.util.List;

import com.mooc.entity.Course;
/**
 * 
 * @author ccnoobs-杨祺晖
 *
 */
public interface CourseMapper {
	public List<Course> coursesearch(String scarch);
	public List<Course> selectAllCourse();
	public List<Course> ageType0();
	public List<Course> ageType1();

    public List<Course> ageType2();

    public List<Course> ageType3();

	Course selectlastcourse();
    int deleteByPrimaryKey(String id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}