package com.haebub.controller.mypage;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.service.mypage.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

    private final MypageService mypageService;
    @RequestMapping
    public String mypage(Model model//, int uid
                          ){
        int uid = 7; // (수정) 임의 데이터
        List<LectureListDTO> list = mypageService.getLectureList(uid);
        model.addAttribute("list", list);
        return "/mypage/lecturelist";
    }

    @GetMapping("/paid")
    public String lecturelist() {
        return "/mypage/paid";
    }


}
