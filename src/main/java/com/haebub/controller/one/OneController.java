package com.haebub.controller.one;

import com.haebub.dto.one.OneDTO;
import com.haebub.service.one.OneSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class OneController {

    private OneSerivce oneSerivce;

    @Autowired
    public OneController(OneSerivce oneSerivce){this.oneSerivce = oneSerivce;}

    @GetMapping("/oneinsert")
    public String onoform(@RequestParam String lid, HttpServletRequest request
                          ,Model model){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        int uid = oneSerivce.getuid(id);
        model.addAttribute("lid",lid);
        model.addAttribute("uid",uid);


        return "one/oneinsert";
    }

//    @PostMapping("/one_result")
//    public String oneinsert(HttpServletRequest request
//                            , OneDTO oneDTO ){
//        String uid=request.getParameter("uid");
//        String lid=request.getParameter("lid");
//        request.setAttribute("uid",uid);
//        request.setAttribute("lid",lid);
//        request.setAttribute("oneinsert","/one/oneinsert.jsp");
//
//        oneSerivce.oneinsert(oneDTO);
//
//        return "redirect:/index";
//    }
    @PostMapping("/one_result")
    public String oneinsert(HttpServletRequest request, OneDTO dto,Model model){

       //HttpSession session=request.getSession();

           oneSerivce.oneinsert(dto);
/*
      model.addAttribute("uid",dto.getUid());
      model.addAttribute("lid",dto.getLid());
      String otitle=dto.getOtitle();
      String ocontent=dto.getOcontent();
      model.addAttribute("otitle",otitle);
      model.addAttribute("ocontent",ocontent);*/

        return "redirect:/index";
    }

    @GetMapping("/onelist")
    public String onelist(Model model){

        List<OneDTO> list=oneSerivce.onelist();
        model.addAttribute("list",list);
        return "/one/onelist";
    }
    @GetMapping("/onedetail/{ono}")
    public String oneDetail(@PathVariable int ono,Model model){
        OneDTO  oneDetail=oneSerivce.oneDetail(ono);
        model.addAttribute("oneDetail",oneDetail);
        return "/one/onedetail";
    }
    @PostMapping("/onedetail_result")
    public String oneDetailinsert(@ModelAttribute OneDTO dto){
        System.out.println("eee"+dto.getOno());
        oneSerivce.oneDetailinsert(dto);
        return "redirect:/index/onelist";
    }
    @GetMapping("/onelist/delete/{ono}")
    public String onedelete(@PathVariable int ono){
        oneSerivce.onedelete(ono);
        return "redirect:/index/onelist";
    }



}
