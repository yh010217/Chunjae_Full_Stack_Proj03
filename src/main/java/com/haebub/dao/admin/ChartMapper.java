package com.haebub.dao.admin;

import com.haebub.dto.admin.PayTableDTO;
import com.haebub.dto.admin.UserTableDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ChartMapper {

    //List<HashMap<String, Object>> getUserChart();
    List<HashMap<String, Object>> getUserChart();

    List<HashMap<String, Object>> getPayChart();

    int getStudentCount();

    int getTeacherCount();

    int getPayPerWeek();

    int getLectureCount();

    List<UserTableDTO> getRecentUser(HashMap<String, Object> hm);

    int getPayCount();

    List<PayTableDTO> getRecentPay(HashMap<String, Object> hm);
}
