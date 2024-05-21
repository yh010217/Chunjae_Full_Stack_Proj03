package com.haebub.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin/main")
    public String adminMain(){


        return "admin/admin_main";
    }

}
