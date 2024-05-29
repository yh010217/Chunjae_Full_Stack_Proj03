package com.haebub.controller.Lecture;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.PaidDTO;
import com.haebub.dto.video.VideoDTO;
import com.haebub.service.lecture.LectureService;
import com.haebub.service.mypage.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
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

    // 삭제하기
    @GetMapping("/lectureDelete/{lid}")
    public String lectureDelete(@PathVariable(required = false) int lid) {

        lecService.lecDelete(lid);
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

    // 디테일 화면
    @GetMapping("/lecdetail/{lid}")
    public String lectureDetail(@PathVariable int lid, Model model, HttpServletRequest request) {

        // 로그인한 세션 가져오기
        HttpSession session = request.getSession(false);
        String id = (String) session.getAttribute("id");

        if (id != null) {
            // 결제한사람의 세션 아이디 통해서 uid 알아오기...
            int uid = lecService.uid(id);

            // 결제한 사람 아이디 알아오기
            HashMap<String, Object> o = new HashMap<>();
            o.put("uid", uid);
            o.put("lid", lid);
            String userid = lecService.id(o);
            model.addAttribute("userid", userid);
        }

        // 리스트
        LectureDTO dto = lecService.lecDatail(lid);
        model.addAttribute("dto", dto);

        // 강의 리스트 뽑아오기
        List<VideoDTO> video = lecService.video(lid);
        model.addAttribute("video", video);

        // 해당 강의 선생님 알아오기
        String tid = lecService.tec_id(lid);
        model.addAttribute("tid", tid);

       /* // 만약 총 강의 갯수보다...
        int count = lecService.lecCount(lid); // 현재 lid에 있는 lcount 체크

        // 최대 쿼리수를 넘는지 확인하고 삽입 결정
        int maxQueryCount = ...; // 최대 쿼리수를 설정
        if (count >= maxQueryCount) {
            throw new RuntimeException("동영상 삽입 실패: 추가 못함");
        }

        // 쿼리수가 허용 한도 내에 있으면 동영상을 삽입
        */

        // 개강 안 한 애들 며칠 남았는지 출력하는 어쩌고...
        int open = lecService.getOpenDate(lid);
        model.addAttribute("open", open);

        // 해당 강의 video 총 갯수 알아오기...
        int videoCount = lecService.getVideoCount(lid);
        model.addAttribute("videoCount", videoCount);

        return "/lecture/detail";
    }

    // 검색 기능 구현하기
    @GetMapping("/listjson")
    @ResponseBody
    public List<LectureDTO> listJson(@RequestParam(required = false) String insert_search) {
        return lecService.searchResult(insert_search);
    }
}
