package com.haebub.dao.admin;

import com.haebub.dto.notice.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface AdminNoticeMapper {

    int totalCount(HashMap<String, Object> hm);

    List<NoticeDTO> noticelist(HashMap<String, Object> hm);

    int noticelistresult(NoticeDTO dto);

    NoticeDTO detadetailNot(int nno);

    void noticedelete(int nno);

    NoticeDTO noticemodify(int nno);

    void noticemodifyresult(NoticeDTO dto);
}
