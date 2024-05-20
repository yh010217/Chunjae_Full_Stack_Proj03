package com.haebub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

    @GetMapping
    public String fav(int uid){
        //뭔가 코드
        return "fav";
    }

}
