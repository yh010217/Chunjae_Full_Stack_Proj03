package com.haebub.controller.video;

import com.haebub.dto.video.VideoDTO;
import com.haebub.service.video.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
public class VideoController {
    private final VideoService service;
    @Autowired
    public VideoController(VideoService service) {
        this.service = service;
    }

    // 비디오 출력 페이지
    @GetMapping ("/video/{lid}")
    public String video(@PathVariable(required = false) int lid, VideoDTO dto,  Model model) {
        // 비디오 link 긁어오기
        String link = service.link(dto, lid);
        model.addAttribute("link", link);
        System.out.println(link + ">>>>>>> link");

        List<VideoDTO> list = service.videoResult(lid);
        VideoDTO title = service.lecTitle(lid);
        model.addAttribute("list", list); // 비디오 제목들
        model.addAttribute("title", title); // 강의 타이틀
        return "/video/video";
    }

    // 비디오 넣는 페이지
    @GetMapping ("/videoinsert/{lid}")
    public String videoInsert(@PathVariable int lid, VideoDTO dto, Model model) {
        int id = service.lid(lid);
        model.addAttribute("item", id);
        return "/video/insertVideo";
    }

    // 비디오 처리
    @PostMapping("/videoAction/{lid}")
    public String videoInsertResult(@RequestParam(required = false) int lid,
            HttpServletRequest request, VideoDTO dto, Model model) {

        String base = "/uploadVideo";
        String realpath = request.getSession().getServletContext().getRealPath(base);
        System.out.println("realpath >>>>>>>> " + realpath);
        try {
            service.insertVideo(realpath, dto, lid);
        } catch (IOException e) {
            System.out.println(e);
        }

        return "redirect:/index/video/{lid}";
    }

    // 비디오 출력하기
    @GetMapping(value="/getVideo/{filename}")
    public ResponseEntity<byte[]> getVideo(@PathVariable String filename, HttpServletRequest request) {

        String path = "/uploadVideo";
        String realpath = request.getSession().getServletContext().getRealPath(path);
        System.out.println(filename + ">>>>>>>>>>> filename");

        String fname = URLEncoder.encode(filename, StandardCharsets.UTF_8).replace("+", "%20");
        /*String fname = "";
        if (filename.contains("_")) {
            String[] truename = filename.split("_");
            fname = URLEncoder.encode(truename[1], StandardCharsets.UTF_8).replace("+", "%20");
        } else {
            fname = URLEncoder.encode(filename, StandardCharsets.UTF_8).replace("+", "%20");
        }*/

        System.out.println(fname + " >>>>>>>>>>>>> fname");
        InputStream in = null;

        ResponseEntity<byte[]> entity = null;
        try {
            in = new FileInputStream(realpath + "/" + fname);
            System.out.println(in + " >>>>>>>>>>>>> in");
            HttpHeaders headers = new HttpHeaders();

            entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in), headers, HttpStatus.OK);
            System.out.println(entity + ">>>>>>>>>>>>>> entity ");
        } catch (IOException e) {
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /*// 주소 검색 막기 http://localhost:8080/index/video/12
    @GetMapping("/index/video/{vid}")
    public ModelAndView showAdminPage (ModelAndView modelAndView, HttpSession httpSession, HttpServletRequest requese
                                       , @PathVariable(required = false) int vid){
        // logger.info("관리자  일반페이지 접속 시도 {}", modelAndView);
        User user = (user)httpSession.getAttribute("loginUser");

        if(ObjectUtils.isEmpty(user) || !"Y".equals(user.getAdminCheck())){
            String errorMsg = "권한이 없습니다";
            modelAndView.addObject("errorMsg", errorMsg);
            modelAndView.addObject("redirectUrl", "/user/loginView");
            modelAndView.setViewName("/common/error");
            // logger.warn("권한이 없는 사용자의 관리자 페이지 접근 > IP address : {}", request.getRemoteAddr());
            return modelAndView;
        }*/
}
