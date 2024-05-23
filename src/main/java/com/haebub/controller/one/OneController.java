package com.haebub.controller.one;

import com.haebub.dto.one.OneDTO;
import com.haebub.service.one.OneSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class OneController {

    private OneSerivce oneSerivce;

    @Autowired
    public OneController(OneSerivce oneSerivce){this.oneSerivce = oneSerivce;}

    @GetMapping("/oneinsert")
    public String onoform(){
        return "one/oneinsert";
    }

    @PostMapping("/index/one_result")
    public String oneinsert(HttpServletRequest request
                            , OneDTO oneDTO ){
        HttpSession session=request.getSession();

        oneSerivce.oneinsert(oneDTO);

        return "redirect:/index/mypage";
    }

}
