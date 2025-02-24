package com.mooc.mapper;

import com.mooc.entity.Report;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReportMapper {
    int insert(@Param("report") Report report);

    List<Report> selectAll();

    Report selectByPrimaryKey(@Param("id") String id);

    void updateByPrimaryKeySelective(@Param("report") Report report);
}
