package com.mooc.entity;

/**
 * @Description
 * @Author Sea
 * @Date 2025/2/23 15:59
 **/
public class CourseProcess {
    private Integer id;
    private Integer courseid;
    private String userid;
    private Integer learntime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getLearntime() {
        return learntime;
    }

    public void setLearntime(Integer learntime) {
        this.learntime = learntime;
    }
}
