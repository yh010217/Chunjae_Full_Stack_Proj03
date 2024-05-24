package com.haebub.controller.mypage;

import com.haebub.controller.comingsoon.CalendarController;
import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.User.UserDTO;
import com.haebub.dto.comingsoon.CalendarDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;
import com.haebub.service.mypage.MypageService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MypageController {

    private final MypageService mypageService;

    private Logger logger = LoggerFactory.getLogger(CalendarController.class);

    /** 마이페이지 */
    @GetMapping("/mypage")
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

    /** 내 강의 보기 - 수강중 */
    @GetMapping("/mypage/lecture")
    @ResponseBody
    public List<HashMap<String, Object>> lectureList(HttpServletRequest request){
        // 로그인한 세션 가져오기
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);
        List<LectureListDTO> list = mypageService.getLectureList(uid);
        List<HashMap<String, Object>> hmlist = new ArrayList<>();

        for (LectureListDTO dto : list) {

            HashMap<String, Object> hm = new HashMap<>();
            hm.put("lid", dto.getLid());
            hm.put("ltitle", dto.getLtitle());
            hm.put("startDate", dto.getStartDate());
            hm.put("endDate", dto.getEndDate());
            hm.put("tsubject", dto.getTsubject());
            hm.put("name", dto.getName());
            hm.put("now", dto.getNow());
            hm.put("status", dto.getStatus());

            hmlist.add(hm);
        }

         logger.info(hmlist.toString());

        return hmlist;
    }

    /** 내 강의 보기 - 수강완료 */
    @GetMapping("/mypage/lecture2")
    @ResponseBody
    public List<HashMap<String, Object>> lectureList2(HttpServletRequest request){
        // 로그인한 세션 가져오기
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);
        List<LectureListDTO> list = mypageService.getLectureList2(uid);
        List<HashMap<String, Object>> hmlist = new ArrayList<>();

        for (LectureListDTO dto : list) {

            HashMap<String, Object> hm = new HashMap<>();
            hm.put("ltitle", dto.getLtitle());
            hm.put("startDate", dto.getStartDate());
            hm.put("endDate", dto.getEndDate());
            hm.put("tsubject", dto.getTsubject());
            hm.put("name", dto.getName());
            hm.put("now", dto.getNow());
            hm.put("status", dto.getStatus());

            hmlist.add(hm);
        }

        //  logger.info(hmlist.toString());

        return hmlist;
    }

    /** 거래 내역 */
    @GetMapping("/mypage/paid")
    public String lecturelist(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);

        List<PaidDTO> paidList = mypageService.getPaidList(uid);
        model.addAttribute("paidList", paidList);

        return "/mypage/paid";
    }

    /** 회원 정보 가져오기  */
    @GetMapping("/mypage/modify")
    public String userModify(Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        int uid = mypageService.getUid(id);

        UserDTO dto = mypageService.getUser(uid);

        model.addAttribute("dto", dto);

        return "/mypage/modify";
    }

    /** 회원 정보 수정 */
    @PostMapping("/modifyresult")
    public String userModifyResult(UserDTO dto){

        logger.info("dto..",dto.toString());
        logger.info("uid.."+dto.getUid());
        logger.info("nickname.."+dto.getNickname());

        int result = mypageService.userModify(dto);
        //logger.info("result....",result);

       return "redirect:/index/mypage";
    }

}
