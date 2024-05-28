package com.haebub.dao.pay;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PaymentMapper {
    int makeCustomer(HashMap<String, Object> hm);
    int makeProduct(HashMap<String, Object> hm);

    int purchaseOne(HashMap<String, Object> hm);

    int insertCart(HashMap<String, Object> hm);

    List<HashMap<String, Object>> getCartList(String uid);

    int insertCartOrder(HashMap<String,Object> hm);

    int getPid(String sp_ocode);

    int insertItem(HashMap<String, Object> itemhm);

    int insertItemOne(HashMap<String, Object> itemhm);

    HashMap<String, Object> getOneItem(String piid);

    HashMap<String, Object> getCartItem(HashMap<String, Object> hm);

    int refundUpdate(String piid);

    void deleteFav(HashMap<String,Object> hm);

    int cartIn(HashMap<String, Object> hm);

    String canRefund(HashMap<String, Object> hm);
}
