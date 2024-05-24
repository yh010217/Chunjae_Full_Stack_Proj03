package com.haebub.service.pay;

import com.haebub.dao.pay.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class PaymentServiceImple implements PaymentService {

    private PaymentMapper paymentMapper;

    @Autowired
    public PaymentServiceImple(PaymentMapper paymentMapper) {
        this.paymentMapper = paymentMapper;
    }

    @Override
    public int makeCustomer(String email, String sp_uid) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("email", email);
        hm.put("sp_uid", sp_uid);
        int result = paymentMapper.makeCustomer(hm);
        return result;
    }

    @Override
    public int makeProduct(String lid, String sp_pcode, String sp_pplan) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("lid", lid);
        hm.put("sp_pcode", sp_pcode);
        hm.put("sp_pplan", sp_pplan);
        int result = paymentMapper.makeProduct(hm);
        return result;
    }

    @Override
    public int purchaseOne(String order_code, String status, String uid, String lid) {

        HashMap<String, Object> hm = new HashMap<>();
        hm.put("order_code", order_code);
        hm.put("success", status);
        hm.put("uid", uid);
        hm.put("lid", lid);

        int result = paymentMapper.purchaseOne(hm);
        return result;
    }

    @Override
    public int insertCart(String uid, String lid) {

        HashMap<String, Object> hm = new HashMap<>();
        hm.put("uid", uid);
        hm.put("lid", lid);
        int result = paymentMapper.insertCart(hm);
        return result;
    }

    @Override
    public List<HashMap<String, Object>> getCartList(String uid) {
        List<HashMap<String, Object>> hmlist
                = paymentMapper.getCartList(uid);
        return hmlist;
    }

    @Override
    @Transactional
    public void insertCartPay(String uid, String order_code, String lid_attached, String order_item_code) {
        //purchase에 uid,sp_ocode,(p_time)넣고!
        //그렇게 생긴 purchase 의 pid 가져오고!
        //그 pid 가지고 pitem insert 집어넣음 되지 않겄나
        HashMap<String,Object> orderhm = new HashMap<>();
        orderhm.put("uid",uid);
        orderhm.put("sp_ocode",order_code);

        paymentMapper.insertCartOrder(orderhm);

        int pid = paymentMapper.getPid(order_code);
        System.out.println("pid : "+pid);

        String[] lids = lid_attached.split("_");
        String[] oicodes = order_item_code.split(",");
        int size = lids.length;

        HashMap<String,Object> itemhm;
        for (int i = 0; i < size; i++) {
            itemhm = new HashMap<>();
            itemhm.put("sp_oitem",oicodes[i]);
            itemhm.put("lid",lids[i]);
            itemhm.put("pid",pid);
            paymentMapper.insertItem(itemhm);
        }

    }

    @Override
    public void insertOnePay(String uid, String lid, String order_code) {

        HashMap<String,Object> orderhm = new HashMap<>();
        orderhm.put("uid",uid);
        orderhm.put("sp_ocode",order_code);

        paymentMapper.insertCartOrder(orderhm);

        int pid = paymentMapper.getPid(order_code);


        HashMap<String,Object> itemhm= new HashMap<>();
        itemhm.put("sp_oitem",order_code);
        itemhm.put("lid",lid);
        itemhm.put("pid",pid);
        paymentMapper.insertItemOne(itemhm);

    }

}
