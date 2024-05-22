package com.haebub.controller.pay;

import com.haebub.service.pay.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PayController {

    private PaymentService paymentService;
    @Autowired
    public PayController(PaymentService paymentService){
        this.paymentService=paymentService;
    }

    @GetMapping("/pay/fail")
    public String payFail(@RequestParam String error, Model model){
        model.addAttribute("error",error);
        return "pay/fail";
    }

    @GetMapping("/pay/success_customer")
    public String successCustomer(@RequestParam String email, @RequestParam String sp_uid){


        int result = paymentService.makeCustomer(email,sp_uid);

        return "redirect:/login";
    }

    @GetMapping("/pay/success_product")
    public String successProduct(@RequestParam String lid, @RequestParam String sp_pcode
                            ,@RequestParam String sp_pplan){

        //update 하는 쿼리 조지기 sp_pcode, sp_pplan

        return "redirect:/index/lecturelist";
    }




}
