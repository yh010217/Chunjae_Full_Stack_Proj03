package com.haebub.controller.teacher;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class teacherController {

    @GetMapping("/teacher")
    public String teacherList() {
        return "/teacher/list";
    }
}
