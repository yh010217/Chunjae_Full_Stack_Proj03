package com.haebub.dao.index;

import com.haebub.dto.IndexDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IndexMapper {
    List<IndexDTO> newList();

    List<IndexDTO> popList();

    List<IndexDTO> popTeacher();
}
