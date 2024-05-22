package com.haebub.controller.admin;

import com.haebub.dto.admin.ChartDTO;
import com.haebub.dto.admin.ChartTestDTO;
import com.haebub.service.admin.ChartService;
import com.haebub.service.admin.ChartTestService;
import com.haebub.service.admin.ChartTestServiceImple;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

//    private final ChartTestService chartTestService;
    private final ChartService chartService;

    @GetMapping("/admin/main")
    public String adminMain(){
        return "admin/admin_main";
    }

    @GetMapping("/admin/template")
    public String adminTemplate(){
        return "admin/admin_template";
    }
    @GetMapping("/admin/chart_test")
    public String adminChart(){
        return "admin/chart_test";
    }
    @GetMapping("/admin/chart/user")
    public @ResponseBody List<HashMap<String,Object>> user_join_chart(){
        List<HashMap<String,Object>> list = chartService.getJoinChart();
        return list;
    }
}
