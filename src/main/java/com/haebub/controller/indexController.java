package com.haebub.controller;

import com.haebub.dto.IndexDTO;
import com.haebub.service.IndexService;
import lombok.RequiredArgsConstructor;
import org.aspectj.apache.bcel.classfile.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class indexController {

    private final IndexService indService;

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

    // 메인 중앙
    @GetMapping(value = "mainlist")
    public String mainlist(Model model) {
        
        // 최신순
        List<IndexDTO> newList = indService.newlist();
        model.addAttribute("newList", newList);

        // 인기순
        List<IndexDTO> popList = indService.popList();
        model.addAttribute("popList", popList);

        return "/main/mainlist";
    }



    @GetMapping( value="/getImage/{lid}", produces = {MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_PNG_VALUE})
    public ResponseEntity<byte[]> getImage(@PathVariable String lid
            , HttpServletRequest request) {
        String path="/uploadImg";
        String realpath= request.getSession().getServletContext().getRealPath(path);
        String fname = "";
        if (lid.contains("_")) {
            String[] truename = lid.split("_");
            fname = URLEncoder.encode(truename[1], StandardCharsets.UTF_8).replace("+", "%20");
        } else {
            fname = URLEncoder.encode(lid, StandardCharsets.UTF_8).replace("+", "%20");
        }
        InputStream in = null;
        // System.out.println(fname + ">>>>>>>>>>> fname");
        ResponseEntity<byte[]> entity=null;
        try {
            in = new FileInputStream(realpath + "/" + fname);
            //System.out.println(realpath + " >>>>> realpath");
            // System.out.println(in + " >>>>> in ");
            HttpHeaders headers=new HttpHeaders();

            entity=new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in)
                    ,headers,  HttpStatus.OK);

            // System.out.println(entity +  " >>>>> entity");
        }catch(IOException e)
        {
            System.out.println(e+".....file not found 안녕!!!!!!!!!");
            entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}