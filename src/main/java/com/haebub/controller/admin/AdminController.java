package com.haebub.controller.admin;

import com.haebub.dto.admin.ChartDTO;
import com.haebub.dto.admin.ChartTestDTO;
import com.haebub.dto.admin.PayTableDTO;
import com.haebub.dto.admin.UserTableDTO;
import com.haebub.service.admin.ChartService;
import com.haebub.service.admin.ChartTestService;
import com.haebub.service.admin.ChartTestServiceImple;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

//    private final ChartTestService chartTestService;
    private final ChartService chartService;

    @GetMapping("/admin/main")
    public String adminMain(Model model){
        HashMap<String,Object> hm = chartService.getStatus();
        model.addAttribute("hm",hm);
        return "admin/admin_main";
    }

    @GetMapping("/admin/template")
    public String adminTemplate(){
        return "admin/admin_template";
    }
    @GetMapping("/admin/chart/user")
    public @ResponseBody List<HashMap<String,Object>> user_join_chart(){
        List<HashMap<String,Object>> list = chartService.getJoinChart();
        return list;
    }
    @GetMapping("/admin/chart/pay")
    public @ResponseBody List<HashMap<String,Object>> pay_chart(){
        List<HashMap<String,Object>> list = chartService.getPayChart();
        return list;
    }

    @GetMapping({"/admin/recent/user/{page}","admin/recent/user"})
    public @ResponseBody HashMap<String,Object> getRecentUser(@PathVariable(required = false) String page){
        int intPage = 1;
        try{
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage=1;
            System.out.println("숫자 입력하시고");
        }
        int pageSize = 10;

        int userCount = chartService.getUserCount();
        int totalPage = (userCount/pageSize) + (userCount%pageSize == 0 ? 0 : 1);

        int blockSize = 5;
        int blockStart = ((intPage-1)/blockSize)*blockSize + 1;
        int blockEnd = blockStart + blockSize - 1;
        if(blockEnd > totalPage) blockEnd = totalPage;
        boolean prev = (blockStart != 1);
        boolean next = (blockEnd != totalPage);

        List<UserTableDTO> list = chartService.getRecentUser(intPage,pageSize);

        HashMap<String,Object> hm = new HashMap<>();
        hm.put("block_start",blockStart);
        hm.put("block_end",blockEnd);
        hm.put("prev",prev);
        hm.put("next",next);
        hm.put("user_list",list);
        hm.put("total",totalPage);

        return hm;
    }
    @GetMapping({"/admin/recent/pay/{page}","admin/recent/pay"})
    public @ResponseBody HashMap<String,Object> getRecentPay(@PathVariable(required = false) String page){
        int intPage = 1;
        try{
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage=1;
            System.out.println("숫자 입력하시고");
        }
        int pageSize = 10;

        int payCount = chartService.getPayCount();
        int totalPage = (payCount/pageSize) + (payCount%pageSize == 0 ? 0 : 1);

        int blockSize = 5;
        int blockStart = ((intPage-1)/blockSize)*blockSize + 1;
        int blockEnd = blockStart + blockSize - 1;
        if(blockEnd > totalPage) blockEnd = totalPage;
        boolean prev = (blockStart != 1);
        boolean next = (blockEnd != totalPage);

        List<PayTableDTO> list = chartService.getRecentPay(intPage,pageSize);

        HashMap<String,Object> hm = new HashMap<>();
        hm.put("block_start",blockStart);
        hm.put("block_end",blockEnd);
        hm.put("prev",prev);
        hm.put("next",next);
        hm.put("pay_list",list);
        hm.put("total",totalPage);

        return hm;
    }

}
