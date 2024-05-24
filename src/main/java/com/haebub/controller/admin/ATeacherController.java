package com.haebub.controller.admin;

import com.haebub.service.admin.TeacherService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ATeacherController {

    private final TeacherService teacherService;

    /** 강사 관리 */
    @GetMapping("/admin/teacher")
    public String teacher(){
        return "admin/admin_teacher";
    }

    /** 강사 등록 */
    @GetMapping("/admin/register")
    public String register(){
        return "admin/teacher_register";
    }

}
