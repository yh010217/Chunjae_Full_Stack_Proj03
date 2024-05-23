package com.haebub.service.pay;

import com.haebub.dao.pay.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class PaymentServiceImple implements PaymentService {

    private PaymentMapper paymentMapper;
    @Autowired
    public PaymentServiceImple(PaymentMapper paymentMapper){
        this.paymentMapper = paymentMapper;
    }

    @Override
    public int makeCustomer(String email, String sp_uid) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("email",email);
        hm.put("sp_uid",sp_uid);
        int result = paymentMapper.makeCustomer(hm);
        return result;
    }
}
