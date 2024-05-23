package com.haebub.dao.one;

import com.haebub.dto.one.OneDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
@Mapper
public interface OneMapper {


    void oneinsert(OneDTO oneDTO);

    int getuid();

    int getlid();

}
