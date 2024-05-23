package com.haebub.service.pay;

import com.haebub.dao.pay.PayUserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PayUserServiceImple implements PayUserService{

    private final PayUserMapper userMapper;
    @Override
    public HashMap<String,Object>  getUid(String id) {
        return userMapper.getUid(id);
    }

    @Override
    public HashMap<String, Object> getLec(String lid) {
        return userMapper.getLec(lid);
    }
}
