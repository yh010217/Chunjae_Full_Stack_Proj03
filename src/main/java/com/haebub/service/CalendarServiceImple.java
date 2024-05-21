package com.haebub.service;

import com.haebub.dao.CalendarMapper;
import com.haebub.dto.CalendarDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("calendarService")
@RequiredArgsConstructor
public class CalendarServiceImple implements CalendarService {

    private final CalendarMapper calendarMapper;

    /* 달력 강의 목록 */
    @Override
    public List<CalendarDTO> calList() {
        return calendarMapper.calList();
    }
}
