package com.haebub.controller.Lecture;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.service.lecture.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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
        List<LectureDTO> list = lecService.lectureList();
        model.addAttribute("list", list);
        // model.addAttribute("page", "lecture/list");
        return "/lecture/list";
    }

    // 추가하기
    @GetMapping("/lectureinsert")
    public String lectureInsert(LectureDTO dto, Model model) {
        model.addAttribute("dto", dto);
        return "/lecture/insert";
    }

    @PostMapping("/insertresult")
    public String lectureInsertResult(LectureDTO dto, Model model) {
        /*String base="/uploadImg";

        String realpath= request.getSession().getServletContext().getRealPath(base);  // 실제 경로를 받아서
        System.out.println("realpath....."+realpath);
        try {
            lecService.insertData(realpath, dto);
        } catch(IOException e)
        {
            System.out.println(e);
        }*/

        lecService.insertData(dto);
        //return "redirect:/index/lecturelist";

        model.addAttribute("lid",dto.getLid());
        String title5 = dto.getLtitle().substring(0,5);
        model.addAttribute("ltitle",title5);
        model.addAttribute("price",dto.getLprice());
        return "pay/make_product";
    }

    @GetMapping("/lecdetail/{lid}")
    public String lectureDetail(@PathVariable int lid, Model model) {
        LectureDTO dto = lecService.lecDatail(lid);
        model.addAttribute("dto", dto);
        return "/lecture/detail";
    }

    @GetMapping("/aaa")
    public String test() {
        return "/lecture/test";
    }
}
