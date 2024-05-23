package com.haebub.controller.mypage;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;
import com.haebub.service.mypage.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

    private final MypageService mypageService;
    /** 마이페이지 */
    @RequestMapping
//    @GetMapping("/mypage")
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
    /** 거래 내역 */
    @GetMapping("/paid")
    public String lecturelist(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);

        List<PaidDTO> paidList = mypageService.getPaidList(uid);
        model.addAttribute("paidList", paidList);

        return "/mypage/paid";
    }

    /** 회원 정보 가져오기  */
    @GetMapping("/modify")
    public String userModify(Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);

        UserDTO userDTO = mypageService.getUser(uid);

        model.addAttribute("userDTO", userDTO);

        return "/mypage/modify";
    }

    /** 회원 정보 수정 */
    @PostMapping("/modifyresult")
    public String userModifyResult(UserDTO dto){
        mypageService.userModify(dto);
       return "redirect:/index/mypage";
    }


}
