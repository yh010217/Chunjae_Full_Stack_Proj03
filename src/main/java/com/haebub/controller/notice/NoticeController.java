package com.haebub.controller.notice;

import com.haebub.dto.notice.NoticeDTO;
import com.haebub.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class NoticeController {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService){this.noticeService=noticeService;}

    @GetMapping("/noticelist")
    public String noticelist(Model model){
        List<NoticeDTO> noticelist=noticeService.noticelist();
        model.addAttribute("noticelist",noticelist);
        return "notice/noticelist";
    }





}
