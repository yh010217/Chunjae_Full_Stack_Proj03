package com.haebub.controller.notice;

import com.haebub.dto.notice.NoticeDTO;
import com.haebub.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class NoticeController {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService){this.noticeService=noticeService;}

    @GetMapping(value = {"/noticelist/{page}", "/noticelist"})
    public String noticelist(@PathVariable(required = false)
                                    String page
                             ,@RequestParam(required = false,defaultValue = "")String search
                             ,@RequestParam(required = false,defaultValue = "")String searchtxt
                                    ,Model model){
        int currpage=1;
        if(page!=null)
            currpage=Integer.parseInt(page);

        int pagesize=10;
        int pageblock=5;
        int startrow=(currpage-1)*pagesize;

        int totalCount=noticeService.totalCount(search, searchtxt);
        int totalpage=(int)Math.ceil(totalCount/(float)pagesize);

        int startblock=((currpage-1)/pageblock)*pageblock+1;
        int endblock=startblock+pageblock-1;
        if (totalpage < endblock)
            endblock=totalpage;
        List<NoticeDTO> noticelist=noticeService.noticelist(startrow,pagesize,search,searchtxt);
        model.addAttribute("noticelist",noticelist);
        model.addAttribute("currpage",currpage);
        model.addAttribute("search",search);
        model.addAttribute("searchtxt",searchtxt);
        model.addAttribute("startblock",startblock);
        model.addAttribute("endblock",endblock);
        model.addAttribute("totalpage",totalpage);

        return "notice/noticelist";

    }





}
