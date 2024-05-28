package com.haebub.service.admin;

import com.haebub.dto.admin.PayTableDTO;
import com.haebub.dto.admin.UserTableDTO;

import java.util.HashMap;
import java.util.List;

public interface ChartService {
    List<HashMap<String,Object>> getJoinChart();

    List<HashMap<String, Object>> getPayChart();

    HashMap<String, Object> getStatus();

    List<UserTableDTO> getRecentUser(int page, int pageSize);

    int getUserCount();

    int getPayCount();

    List<PayTableDTO> getRecentPay(int page, int pageSize);
}
