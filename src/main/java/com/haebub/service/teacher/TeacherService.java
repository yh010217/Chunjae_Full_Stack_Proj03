package com.haebub.service.teacher;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;

import java.io.IOException;
import java.util.List;

public interface TeacherService {
    List<TeacherDTO> getlist();

    TeacherDTO getdetailList(int tid);

    void insertData(String realpath, LectureDTO dto, int tid) throws IOException;

    int getTid(int tid);

    TeacherDTO getInfo(int tid);

    List<LectureDTO> getLecList(int tid);

    int getCount(int tid);
}
