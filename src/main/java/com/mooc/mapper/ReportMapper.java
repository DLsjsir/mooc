package com.mooc.mapper;

import com.mooc.entity.Report;
import org.apache.ibatis.annotations.Param;

public interface ReportMapper {
    int insert(@Param("report") Report report);
}
