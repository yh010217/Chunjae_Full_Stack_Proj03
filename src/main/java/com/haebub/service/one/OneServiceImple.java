package com.haebub.service.one;

import com.haebub.dao.one.OneMapper;
import com.haebub.dto.one.OneDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OneServiceImple implements OneSerivce {
    private final OneMapper oneMapper;

    @Autowired
    public OneServiceImple(OneMapper oneMapper){this.oneMapper=oneMapper;}


    @Override
    public void oneinsert(OneDTO oneDTO) {
        oneMapper.oneinsert(oneDTO);
//        int uid=oneMapper.getuid();
//        int lid=oneMapper.getlid();
//        oneDTO.setLid(lid);
//        oneDTO.setUid(uid);
    }

    @Override
    public int getuid(String id) {
        return oneMapper.getuid(id);
    }

    @Override
    public List<OneDTO> onelist() {
        List<OneDTO> list=oneMapper.onelist();
        return list;
    }

    @Override
    public OneDTO oneDetail(int ono) {
        OneDTO dto=oneMapper.oneDetail(ono);
        return dto;
    }

    @Override
    public void oneDetailinsert(OneDTO dto) {
       oneMapper.oneDetailinsert(dto);
    }

    @Override
    public void onedelete(int ono) {
        oneMapper.onedelete(ono);
    }

}
