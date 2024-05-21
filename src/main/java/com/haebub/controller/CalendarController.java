package com.haebub.controller;

import com.haebub.dto.CalendarDTO;
import com.haebub.service.CalendarService;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CalendarController {

    private Logger logger = LoggerFactory.getLogger(CalendarController.class);
    private final CalendarService calendarService;

    /* 오픈 일정 달력 */
    @GetMapping("/comingsoon")
    @ResponseBody
    public List<HashMap<String, Object>> calendar() {
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        List<CalendarDTO> list = calendarService.calList();     // 강의 일정 목록
        List<HashMap<String, Object>> hmlist = new ArrayList<>();

        for (CalendarDTO dto : list) {

            HashMap<String, Object> hm = new HashMap<>();
            hm.put("start", dto.getLopendate());
            hm.put("title", dto.getLtitle());
//            hm.put("subject", dto.getTsubject());
//            hm.put("name", dto.getName());

            jsonObject = new JSONObject(hm);
            jsonArray.put(jsonObject);
            hmlist.add(hm);
        }

//        logger.info("jsonArray..{}", jsonArray);
        return hmlist;
    }
}
