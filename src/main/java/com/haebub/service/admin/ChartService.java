package com.haebub.service.admin;

import java.util.HashMap;
import java.util.List;

public interface ChartService {
    List<HashMap<String,Object>> getJoinChart();

    List<HashMap<String, Object>> getPayChart();

    HashMap<String, Object> getStatus();
}
