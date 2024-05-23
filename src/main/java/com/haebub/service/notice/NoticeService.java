package com.haebub.service.notice;

import com.haebub.dto.notice.NoticeDTO;

import java.util.List;

public interface NoticeService {
//    List<NoticeDTO> noticelist();

    int totalCount(String search, String searchtxt);

    List<NoticeDTO> noticelist(int startrow, int pagesize, String search, String searchtxt);
}
