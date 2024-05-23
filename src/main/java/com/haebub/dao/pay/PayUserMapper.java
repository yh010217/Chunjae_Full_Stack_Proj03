package com.haebub.dao.pay;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PayUserMapper {
    HashMap<String,Object>  getUid(String id);

    HashMap<String,Object> getLec(String lid);
}
