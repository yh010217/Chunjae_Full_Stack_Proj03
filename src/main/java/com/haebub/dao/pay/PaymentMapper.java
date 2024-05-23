package com.haebub.dao.pay;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface PaymentMapper {
    int makeCustomer(HashMap<String, Object> hm);
    int makeProduct(HashMap<String, Object> hm);

    int purchaseOne(HashMap<String, Object> hm);
}
