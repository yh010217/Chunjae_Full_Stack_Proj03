package com.haebub.service.admin;

import com.haebub.dao.admin.AdminNoticeMapper;
import com.haebub.dto.notice.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminNoticeServiceImple implements AdminNoticeSerivce{


    private final AdminNoticeMapper mapper;


    @Override
    public int totalCount(String search, String searchtxt) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("search",search);
        hm.put("searchtxt",searchtxt);
        return mapper.totalCount(hm);}

    @Override
    public List<NoticeDTO> noticelist(int startrow, int pagesize, String search, String searchtxt) {
        HashMap<String,Object> hm=new HashMap<>();
        hm.put("startrow",startrow);
        hm.put("pagesize",pagesize);
        hm.put("search",search);
        hm.put("searchtxt",searchtxt);

        List<NoticeDTO> list=mapper.noticelist(hm);
        return list;
    }

    @Override
    public int noticelistresult(NoticeDTO dto) {
        int result=mapper.noticelistresult(dto);
        return result;
    }
}
