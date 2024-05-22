package com.haebub.controller;

import org.aspectj.apache.bcel.classfile.Module;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class indexController {

    @GetMapping(value={"/index/{path}","/index", "/index/{path}/{lid}"})
    public String main(@PathVariable(required = false) String path, @PathVariable(required = false)
    String lid, Model model) {
        System.out.println("path : " + path);
        if(path!=null) {
            model.addAttribute("page", path);

        }
        if(lid!=null)
        {
            model.addAttribute("lid",lid);
        }
        return "/index";
    }

}