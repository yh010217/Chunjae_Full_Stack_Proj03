package com.haebub.controller.one;

import com.haebub.dto.one.OneDTO;
import com.haebub.service.one.OneSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import java.util.HashMap;

@Controller
public class OneController {

    private OneSerivce oneSerivce;

    @Autowired
    public OneController(OneSerivce oneSerivce){this.oneSerivce = oneSerivce;}

    @GetMapping("/one")
    public String onoform(){
        return "one/one";
    }
    @PostMapping("/one_result")
    public String oneinsert(OneDTO oneDTO){
        oneSerivce.oneinsert(oneDTO);
        return "redirect:/mypage";
    }

}
