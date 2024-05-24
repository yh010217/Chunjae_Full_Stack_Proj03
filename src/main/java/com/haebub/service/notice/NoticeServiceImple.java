package com.haebub.service.notice;

import com.haebub.dao.notice.NoticeMapper;
import com.haebub.dto.notice.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NoticeServiceImple implements NoticeService{
    private final NoticeMapper noticeMapper;

    @Autowired
    public NoticeServiceImple(NoticeMapper noticeMapper){this.noticeMapper=noticeMapper;}

    @Override
    public int totalCount(String search, String searchtxt) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("search",search);
        hm.put("searchtxt",searchtxt);
        return noticeMapper.totalCount(hm);
    }

    @Override
    public List<NoticeDTO> noticelist(int startrow, int pagesize, String search, String searchtxt) {
        HashMap<String,Object> hm=new HashMap<>();
        hm.put("startrow",startrow);
        hm.put("pagesize",pagesize);
        hm.put("search",search);
        hm.put("searchtxt",searchtxt);

        List<NoticeDTO> list=noticeMapper.noticelist(hm);
        return list;
    }

//    @Override
//    public List<NoticeDTO> noticelist() {
//            return noticeMapper.noticelist();
//    }


}
