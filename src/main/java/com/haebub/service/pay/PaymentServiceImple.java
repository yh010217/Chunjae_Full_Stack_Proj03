package com.haebub.service.pay;

import com.haebub.dao.pay.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

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

    @Override
    public int makeProduct(String lid, String sp_pcode, String sp_pplan) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("lid",lid);
        hm.put("sp_pcode",sp_pcode);
        hm.put("sp_pplan",sp_pplan);
        int result = paymentMapper.makeProduct(hm);
        return result;
    }

    @Override
    public int purchaseOne(String order_code, String status,String uid, String lid) {

        HashMap<String, Object> hm = new HashMap<>();
        hm.put("order_code",order_code);
        hm.put("success",status);
        hm.put("uid",uid);
        hm.put("lid",lid);

        int result = paymentMapper.purchaseOne(hm);
        return result;
    }

    @Override
    public int insertCart(String uid, String lid) {

        HashMap<String,Object> hm = new HashMap<>();
        hm.put("uid",uid);
        hm.put("lid",lid);
        int result = paymentMapper.insertCart(hm);
        return result;
    }

    @Override
    public List<HashMap<String, Object>> getCartList(String uid) {
        List<HashMap<String, Object>> hmlist
                = paymentMapper.getCartList(uid);
        return null;
    }

}
