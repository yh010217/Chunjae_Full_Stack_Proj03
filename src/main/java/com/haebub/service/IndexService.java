package com.haebub.service;

import com.haebub.dto.IndexDTO;

import java.util.List;

public interface IndexService {
    List<IndexDTO> newlist();

    List<IndexDTO> popList();
}
