package com.haebub.service.admin;

import com.haebub.dao.admin.ChartMapper;
import com.haebub.dao.admin.ChartTestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ChartServiceImple implements ChartService{
    private final ChartMapper mapper;

    @Override
    public List<HashMap<String, Object>> getJoinChart() {
        List<HashMap<String,Object>> list = mapper.getUserChart();
        return list;
    }/*
    @Override
    public List<HashMap<String, Object>> getJoinChart() {
        List<HashMap<String,Object>> list = mapper.getUserChart();
        return list;
    }*/
}