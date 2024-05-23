package com.haebub.controller.video;

import com.haebub.dto.video.VideoDTO;
import com.haebub.service.video.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
    public String video(@PathVariable(required = false) int lid, Model model) {

        List<VideoDTO> list = service.videoResult(lid);
        VideoDTO title = service.lecTitle(lid);
        model.addAttribute("list", list); // 비디오 제목들
        model.addAttribute("title", title); // 강의 타이틀
        return "/video/video";
    }
}
