package com.haebub.service.comingsoon;

import com.haebub.dto.comingsoon.CalendarDTO;

import java.util.List;

public interface CalendarService {

    /* 달력 강의 목록 */
    List<CalendarDTO> calList();

}
