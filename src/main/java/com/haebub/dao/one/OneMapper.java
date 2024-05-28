package com.haebub.dao.one;

import com.haebub.dto.one.OneDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OneMapper {


    void oneinsert(OneDTO oneDTO);

    int getuid(String id);

    List<OneDTO> onelist(int lid);

    OneDTO oneDetail(int ono);

    void oneDetailinsert(OneDTO dto);

    void onedelete(int ono);

    int getLTeacher(int lid);
//
//    int getlid();

}
