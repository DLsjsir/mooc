package com.mooc.biz;


import com.mooc.entity.Report;

import java.util.List;

public interface ReportBiz {
    int insert(Report report);

    List<Report> selectAll();

    Report selectByPrimaryKey(String id);

    void updateByPrimaryKeySelective(Report report);

    Report selectReport(String reportuserid, String userid, String comment);
}
