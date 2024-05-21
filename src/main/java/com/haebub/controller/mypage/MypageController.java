package com.haebub.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

    @GetMapping("/mypage")
    public String mypage(){
        return "/mypage/lecturelist";

    }

}
