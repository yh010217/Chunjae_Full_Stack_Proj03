package com.haebub.controller.Lecture;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.service.lecture.LectureService;
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
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
public class LectureController {

    private final LectureService lecService;
    @Autowired
    public LectureController(LectureService lecService) {
        this.lecService = lecService;
    }

    @GetMapping("/lecturelist")
    public String lecturelist(Model model) {


        // 전체 리스트
        List<LectureDTO> list = lecService.lectureList();
        model.addAttribute("list", list);

        // 무료 리스트
        List<LectureDTO> free= lecService.freeList();
        model.addAttribute("free", free);
        return "/lecture/list";
    }

    // 추가하기
    @GetMapping("/lectureinsert")
    public String lectureInsert(LectureDTO dto, Model model) {
        model.addAttribute("dto", dto);
        return "/lecture/insert";
    }

    @PostMapping("/index/insertresult")
    public String lectureInsertResult(HttpServletRequest request, LectureDTO dto, Model model){
        String base="/uploadImg";
        String realpath= request.getSession().getServletContext().getRealPath(base);  // 실제 경로를 받아서
        System.out.println("realpath....."+realpath);
        try {
            lecService.insertData(realpath, dto);
        } catch(IOException e)
        {
            System.out.println(e);
        }

        model.addAttribute("lid",dto.getLid());
        model.addAttribute("ltitle",dto.getLtitle());
        model.addAttribute("price",dto.getLprice());

        //return "redirect:/index/lecturelist";
        return "pay/make_product";
    }

    @GetMapping("/lecdetail/{lid}")
    public String lectureDetail(@PathVariable int lid, Model model) {
        LectureDTO dto = lecService.lecDatail(lid);
        model.addAttribute("dto", dto);
        return "/lecture/detail";
    }
}
