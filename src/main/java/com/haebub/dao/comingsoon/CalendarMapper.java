package com.haebub.dao.comingsoon;

import com.haebub.dto.comingsoon.CalendarDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CalendarMapper {

    /* 달력 강의 목록 */
    List<CalendarDTO> calList();

}
