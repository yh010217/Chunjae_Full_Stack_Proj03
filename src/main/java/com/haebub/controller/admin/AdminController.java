package com.haebub.controller.admin;

import com.haebub.dto.admin.ChartDTO;
import com.haebub.dto.admin.ChartTestDTO;
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

    private final ChartTestService chartTestService;

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
    @GetMapping("/admin/chart_test/hire_chart")
    public @ResponseBody HashMap<String,Object> hire_chart(){
        List<HashMap<String,Object>> list = chartTestService.getHireChart();
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("male",list.get(0));
        hm.put("female",list.get(1));
        System.out.println(hm);

        return hm;
    }
    @GetMapping("/admin/chart_test/hire_chart2")
    public @ResponseBody List<HashMap<String,Object>> hire_chart2(){
        List<HashMap<String,Object>> list = chartTestService.getHireChart();

        return list;
    }


    /*

    @GetMapping("/new_buy_chart")
    public @ResponseBody ChartDTO newBuyChart(){

        ChartDTO chartDTO = new ChartDTO();
        //원래는 서비스, dao에서 가져왔겠지?

        ChartDatasetsDTO datasetsDTO1 = new ChartDatasetsDTO();
        datasetsDTO1.setLabel("user1 dataset");
        datasetsDTO1.setData(new int[]{ 80, 62,56, 55, 40, 59});
        datasetsDTO1.setBorderColor("rgb(192,75,192)");
        datasetsDTO1.setTension(0.1f);

        ChartDatasetsDTO datasetsDTO2 = new ChartDatasetsDTO();
        datasetsDTO2.setLabel("user2 dataset");
        datasetsDTO2.setData(new int[]{45,39,85,45,77,75});
        datasetsDTO2.setBorderColor("rgb(192,192,75)");
        datasetsDTO2.setTension(0.1f);

        chartDTO.setLabels(new String[]{"1","2","3","4","5","6"});
        chartDTO.setDatasets(new ChartDatasetsDTO[]{datasetsDTO1,datasetsDTO2});


        return chartDTO;
    }
     */
}
