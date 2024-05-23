package com.haebub.service.pay;

import java.util.HashMap;

public interface PaymentService {

    public int makeCustomer(String email, String sp_uid);

    int makeProduct(String lid, String sp_pcode, String sp_pplan);
}
