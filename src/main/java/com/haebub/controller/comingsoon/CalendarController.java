package com.haebub.controller.comingsoon;

import com.haebub.dto.comingsoon.CalendarDTO;
import com.haebub.service.comingsoon.CalendarService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comingsoon")
public class CalendarController {

    private Logger logger = LoggerFactory.getLogger(CalendarController.class);

    /** 캘린더 서비스 */
    private final CalendarService calendarService;

    @RequestMapping
    public String viewCalendar(){
        return "/comingsoon/calendar";
    }

    /* 오픈 일정 달력 */
    @GetMapping("/event")
    @ResponseBody
    public List<HashMap<String, Object>> calendar() {

        List<CalendarDTO> list = calendarService.calList();     // 강의 일정 목록
        List<HashMap<String, Object>> hmlist = new ArrayList<>();

        for (CalendarDTO dto : list) {

            HashMap<String, Object> hm = new HashMap<>();
            hm.put("start", dto.getLopendate());
            hm.put("title", "["+dto.getTsubject()+"] "+dto.getLtitle());
            hm.put("subject", dto.getTsubject());
            hm.put("name", dto.getName());
            hm.put("lid", dto.getLid());

            hmlist.add(hm);
        }

       // logger.info(hmlist.toString());

        return hmlist;
    }
}
