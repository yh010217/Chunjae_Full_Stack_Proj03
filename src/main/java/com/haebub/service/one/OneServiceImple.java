package com.haebub.service.one;

import com.haebub.dao.one.OneMapper;
import com.haebub.dto.one.OneDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OneServiceImple implements OneSerivce {
    private final OneMapper oneMapper;

    @Autowired
    public OneServiceImple(OneMapper oneMapper){this.oneMapper=oneMapper;}


    @Override
    public void oneinsert(OneDTO oneDTO) {
        oneMapper.oneinsert(oneDTO);
        int uid=oneMapper.getuid();
        int lid=oneMapper.getlid();
        oneDTO.setLid(lid);
        oneDTO.setUid(uid);
    }

}
