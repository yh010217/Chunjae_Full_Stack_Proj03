package com.haebub.controller.teacher;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;
import com.haebub.service.teacher.TeacherService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class teacherController {

    private final TeacherService teaService;

    @GetMapping("/teacher")
    public String teacherList(Model model) {

        // 선생님 리스트 출력
        List<TeacherDTO> list = teaService.getlist();
        model.addAttribute("list", list);
        return "/teacher/list";
    }

    @GetMapping("/teacher/{tid}")
    public String teacherDetail(@PathVariable(required = false) int tid
                                , Model model) {

        // 리스트 뽑기
        TeacherDTO list = teaService.getdetailList(tid);
        model.addAttribute("list", list);

        // 강좌 보기
        List<LectureDTO> dto = teaService.getLecList(tid);
        model.addAttribute("lec", dto);

        // 개설 강의 몇 개?
        int result = teaService.getCount(tid);
        model.addAttribute("total", result);

        return "/teacher/detail";
    }

    @GetMapping("/lecInsert/{tid}")
    public String lectureInsert(@PathVariable(required = false) int tid, Model model) {

        // 선생님 이름, 과목 얻어오기
        TeacherDTO dto = teaService.getInfo(tid);
        model.addAttribute("dto", dto);

        // 선생님 번호
        int id = teaService.getTid(tid); // tid
        model.addAttribute("tid", id);
        return "/teacher/insert";
    }

    @PostMapping("/index/lecInsertResult/{tid}")
    public String lectureInsertResult(@PathVariable(required = false) int tid
            , HttpServletRequest request, LectureDTO dto, Model model){
        String base="/uploadImg2";
        String realpath= request.getSession().getServletContext().getRealPath(base);  // 실제 경로를 받아서
        System.out.println("tid >>>>>>>>>>>>>>>>>>>>>" + tid);
        try {
            teaService.insertData(realpath, dto, tid);
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


}
