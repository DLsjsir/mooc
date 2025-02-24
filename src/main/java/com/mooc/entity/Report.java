package com.mooc.entity;

public class Report {
    private int id;
    private String userid;

    private String comment;

    private String status;

    private String reportuserid;

    public String getReportuserid() {
        return reportuserid;
    }

    public void setReportuserid(String reportuserid) {
        this.reportuserid = reportuserid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
