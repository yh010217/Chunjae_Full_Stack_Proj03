package com.haebub.dao.notice;

import com.haebub.dto.notice.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDTO> noticelist();


}
