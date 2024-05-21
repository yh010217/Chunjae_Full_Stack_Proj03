package com.haebub.dao.admin;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ChartTestMapper {

    int georgiCount();

    List<HashMap<String,Object>> getHireChart();
}
