package com.haebub.service;

import com.haebub.dto.IndexDTO;
import com.haebub.dto.Lecutre.LectureDTO;

import java.util.List;

public interface IndexService {
    List<IndexDTO> newlist();

    List<IndexDTO> popList();

    List<IndexDTO> popTeacher();

    List<LectureDTO> searchResult(String main_search);
}
