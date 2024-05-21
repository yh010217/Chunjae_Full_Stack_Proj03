package com.haebub.service.lecture;

import com.haebub.dao.Lecture.LectureMapper;
import com.haebub.dto.Lecutre.LectureDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service(value = "lecService")
public class LectureServiceImple implements LectureService {

    private final LectureMapper lecMapper;
    @Autowired
    public LectureServiceImple(LectureMapper lecMapper) {
        this.lecMapper = lecMapper;
    }

    @Override
    public List<LectureDTO> lectureList() {
        List<LectureDTO> list = lecMapper.lectureList();
        return list;
    }

    // 디테일
    @Override
    public LectureDTO lecDatail(int lid) {
        LectureDTO dto = lecMapper.lecDatail(lid);
        return dto;
    }

    @Override
    public void insertData(LectureDTO dto)  {
        lecMapper.insertData(dto);
    }

}
