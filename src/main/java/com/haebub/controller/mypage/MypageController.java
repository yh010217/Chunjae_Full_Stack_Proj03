package com.haebub.controller.mypage;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.service.mypage.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

    private final MypageService mypageService;
    @RequestMapping
    public String mypage(Model model
                         , HttpServletRequest request){

        // 로그인한 세션 가져오기
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        if(id != null) {
            // uid 가져오기
            int uid = mypageService.getUid(id);

            List<LectureListDTO> list = mypageService.getLectureList(uid);
            model.addAttribute("list", list);
            return "/mypage/lecturelist";
        } else {
            return "redirect:/index/login";
        }
    }

    @GetMapping("/paid")
    public String lecturelist() {
        return "/mypage/paid";
    }


}
