package com.haebub.service.admin;

import com.haebub.dao.admin.ChartTestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ChartTestServiceImple implements ChartTestService{

    private final ChartTestMapper mapper;

    public List<HashMap<String,Object>> getHireChart(){
        List<HashMap<String,Object>> list = mapper.getHireChart();
        return list;
    }

}
