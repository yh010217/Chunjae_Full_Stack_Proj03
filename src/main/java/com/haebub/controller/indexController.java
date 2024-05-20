package com.haebub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {

    @GetMapping("/index")
    public String main() {
        return "/main/index";
    }

}
