package com.haebub.service.pay;

import java.util.HashMap;
import java.util.List;

public interface PaymentService {

    public int makeCustomer(String email, String sp_uid);

    int makeProduct(String lid, String sp_pcode, String sp_pplan);

    int purchaseOne(String order_code, String status, String uid, String lid);

    int insertCart(String uid, String lid);

    List<HashMap<String, Object>> getCartList(String uid);
}
