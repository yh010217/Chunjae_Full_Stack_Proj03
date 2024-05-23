package com.haebub.service.notice;

import com.haebub.dao.notice.NoticeMapper;
import com.haebub.dto.notice.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImple implements NoticeService{
    private final NoticeMapper noticeMapper;

    @Autowired
    public NoticeServiceImple(NoticeMapper noticeMapper){this.noticeMapper=noticeMapper;}

    @Override
    public List<NoticeDTO> noticelist() {
            return noticeMapper.noticelist();
    }
}
