package com.haebub.service;

import com.haebub.dao.index.IndexMapper;
import com.haebub.dto.IndexDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImple implements IndexService {
    private final IndexMapper mapper;
    @Autowired
    public IndexServiceImple(IndexMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<IndexDTO> newlist() {
        return mapper.newList();
    }

    @Override
    public List<IndexDTO> popList() {
        return mapper.popList();
    }
}
