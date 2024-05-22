package com.haebub.dao.admin;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ChartMapper {

    //List<HashMap<String, Object>> getUserChart();
    List<HashMap<String, Object>> getUserChart();
}
