package com.haebub.service.lecture;

import com.haebub.dto.Lecutre.LectureDTO;

import java.io.IOException;
import java.util.List;

public interface LectureService {
    void insertData(LectureDTO dto);

    List<LectureDTO> lectureList();

    LectureDTO lecDatail(int lid);
}
