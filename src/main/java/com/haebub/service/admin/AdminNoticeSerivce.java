package com.haebub.service.admin;

import com.haebub.dto.notice.NoticeDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AdminNoticeSerivce {


    int totalCount(String search, String searchtxt);

    List<NoticeDTO> noticelist(int startrow, int pagesize, String search, String searchtxt);

    int noticelistresult(NoticeDTO dto);

    NoticeDTO detadetailNot(int nno);

    void noticedelete(int nno);

    NoticeDTO noticemodify(int nno);

    void noticemodifyresult(NoticeDTO dto);
}
