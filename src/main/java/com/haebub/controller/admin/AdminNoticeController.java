package com.haebub.controller.admin;

import com.haebub.dto.notice.NoticeDTO;
import com.haebub.service.admin.AdminNoticeSerivce;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminNoticeController {

    private final AdminNoticeSerivce adminNoticeSerivce;





    @GetMapping(value = {"/admin/noticelist/{page}", "/admin/noticelist"})
    public String adminnoticelist(@PathVariable(required = false)
                             String page
            , @RequestParam(required = false,defaultValue = "")String search
            , @RequestParam(required = false,defaultValue = "")String searchtxt
            , Model model){
        int currpage=1;
        if(page!=null)
            currpage=Integer.parseInt(page);

        int pagesize=10;
        int pageblock=5;
        int startrow=(currpage-1)*pagesize;

        int totalCount=adminNoticeSerivce.totalCount(search, searchtxt);
        int totalpage=(int)Math.ceil(totalCount/(float)pagesize);

        int startblock=((currpage-1)/pageblock)*pageblock+1;
        int endblock=startblock+pageblock-1;
        if (totalpage < endblock)
            endblock=totalpage;
        List<NoticeDTO> noticelist=adminNoticeSerivce.noticelist(startrow,pagesize,search,searchtxt);
        model.addAttribute("noticelist",noticelist);
        model.addAttribute("currpage",currpage);
        model.addAttribute("search",search);
        model.addAttribute("searchtxt",searchtxt);
        model.addAttribute("startblock",startblock);
        model.addAttribute("endblock",endblock);
        model.addAttribute("totalpage",totalpage);

        return "admin/admin_noticelist";
    }
    @GetMapping("/admin/ins")
    public String noticelistform(){

        return "admin/admin_noticelistform";
    }

    @PostMapping("/admin/noticelist_result")
    public String noticelistresult(NoticeDTO dto){
        int result=adminNoticeSerivce.noticelistresult(dto);
        return "redirect:/admin/noticelist";
    }
    @GetMapping("/admin/noticelist/detail/{nno}")
    public String notDetail(@PathVariable int nno, Model model){
        NoticeDTO detailNot=adminNoticeSerivce.detadetailNot(nno);
        model.addAttribute("detailNot",detailNot);
        return "admin/admin_noticelistdetail";
    }



}
