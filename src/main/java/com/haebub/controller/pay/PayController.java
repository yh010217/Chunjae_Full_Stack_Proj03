package com.haebub.controller.pay;

import com.haebub.service.pay.PayUserService;
import com.haebub.service.pay.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class PayController {

    private final PayUserService userService;
    private final PaymentService paymentService;
//    @Autowired
//    public PayController(PaymentService paymentService){
//        this.paymentService=paymentService;
//    }

    @GetMapping("/pay/fail")
    public String payFail(@RequestParam String error, Model model) {
        model.addAttribute("error", error);
        return "pay/fail";
    }

    @GetMapping("/pay/success_customer")
    public String successCustomer(@RequestParam String email, @RequestParam String sp_uid) {


        int result = paymentService.makeCustomer(email, sp_uid);

        return "redirect:/login";
    }

    @GetMapping("/pay/success_product")
    public String successProduct(@RequestParam String lid, @RequestParam String sp_pcode
            , @RequestParam String sp_pplan) {

        paymentService.makeProduct(lid, sp_pcode, sp_pplan);
        //update 하는 쿼리 조지기 sp_pcode, sp_pplan

        return "redirect:/index/lecturelist";
    }

    @GetMapping("/pay/purchase_one")
    public String purchaseOne(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        HashMap<String, Object> user = userService.getUid(id);
        String lid = request.getParameter("lid");
        HashMap<String, Object> lec = userService.getLec(lid);

        model.addAttribute("uid", user.get("uid"));
        model.addAttribute("sp_uid", user.get("sp_uid"));

        model.addAttribute("lid", lid);
        model.addAttribute("sp_pcode", lec.get("sp_pcode"));
        model.addAttribute("sp_pplan", lec.get("sp_pplan"));
        return "pay/purchase_one";
    }

    @GetMapping("/pay/{lid}/success_one")
    public String successOne(@RequestParam String order_code
            , @RequestParam String status
            , @PathVariable String lid
            , HttpServletRequest request) {

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        HashMap<String, Object> user = userService.getUid(id);
        int uid = (Integer) user.get("uid");
        String suid = uid+"";

        System.out.println(status);
        System.out.println(lid);

        //쿼리조지기
        paymentService.purchaseOne(order_code, status,suid,lid);

        return "redirect:/index/lecturelist";
    }

    @GetMapping("/insert_cart")
    public String insertCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        HashMap<String,Object> hm = userService.getUid(id);
        int uid = (Integer) hm.get("uid");
        String suid = uid+"";

        String lid = request.getParameter("lid");

        paymentService.insertCart(suid,lid);

        return "redirect:/index";
    }


    @GetMapping("/mypage/cart")
    public String myCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        HashMap<String,Object> hm = userService.getUid(id);
        int uid = (Integer) hm.get("uid");
        String suid = uid+"";

        List<HashMap<String,Object>> hmlist = paymentService.getCartList(suid);


        return "/pay/cart";
    }

}
