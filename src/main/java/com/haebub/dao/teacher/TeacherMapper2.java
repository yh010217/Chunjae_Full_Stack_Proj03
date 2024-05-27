package com.haebub.dao.teacher;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;
import org.apache.ibatis.annotations.Mapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface TeacherMapper2 {
    List<TeacherDTO> getList();

    TeacherDTO getDetailList(int tid);

    void insertData(HashMap<String, Object> o) throws IOException;

    int getTid(int tid);

    int getLid();
}
