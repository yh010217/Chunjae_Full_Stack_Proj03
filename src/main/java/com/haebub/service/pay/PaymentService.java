package com.haebub.service.pay;

import java.util.HashMap;
import java.util.List;

public interface PaymentService {

    public int makeCustomer(String email, String sp_uid);

    int makeProduct(String lid, String sp_pcode, String sp_pplan);

    int purchaseOne(String order_code, String uid);

    int insertCart(String uid, String lid);

    List<HashMap<String, Object>> getCartList(String uid);

    void insertCartPay(String uid, String order_code, String lid_attached, String order_item_code);

    void insertOnePay(String uid, String lid, String order_code);

    HashMap<String, Object> getOneItem(String piid);

    HashMap<String, Object> getCartItem(String pid, String piid);

    int refundUpdate(String piid);

    void deleteFav(String lid_attached, String uid);
}
