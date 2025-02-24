package com.mooc.biz.impl;

import com.mooc.biz.ReportBiz;
import com.mooc.entity.Report;
import com.mooc.mapper.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "ReportBiz")
public class ReportBizImpl implements ReportBiz {
    @Autowired
    ReportMapper reportMapper;

    @Override
    public int insert(Report report) {
        return reportMapper.insert(report);
    }

    @Override
    public List<Report> selectAll() {
        return reportMapper.selectAll();
    }

    @Override
    public Report selectByPrimaryKey(String id) {
        return reportMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(Report report) {
       reportMapper.updateByPrimaryKeySelective(report);
    }
}
