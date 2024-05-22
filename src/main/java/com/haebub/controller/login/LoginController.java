package com.haebub.controller.login;

import com.haebub.dto.User.UserDTO;
import com.haebub.service.join.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    private JoinService service;

    @Autowired
    public LoginController(JoinService service) {
        this.service = service;
    }

    @GetMapping("/login")
    public String login(){
        return "login/login";
    }


//    @PostMapping("login_result")
//    public String loginresult(@RequestParam("id") String id
//            , @RequestParam("pwd") String pwd
//            , HttpSession session)
//    {
//
//        int login_result=service.login(id,pwd);
//        if (login_result==1){
//            session.setAttribute("id",id);
//            return "redirect:logout";
//        }else {
//            return "redirect:/login";
//        }
//
//    }
/*

    */

    /** 로그인*/
    @PostMapping("/login_check")
    public ModelAndView login_check(@ModelAttribute UserDTO dto,HttpSession session){
        String name=service.logincheck(dto);
        ModelAndView mav=new ModelAndView();
        if (name!= null){

            session.setAttribute("id",dto.getId());
            session.setAttribute("name",name);
            mav.setViewName("login/logout");
        }else {
            mav.setViewName("redirect:/index/login");
            mav.addObject("message","error");
        }
        return mav;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){


        login_check(null,null);

        HttpSession session=request.getSession(false);
        if (session!=null || session.getAttribute("id")!=null)
            session.invalidate();
        return "redirect:/login";
    }



}
