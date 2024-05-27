package com.haebub.service.one;

import com.haebub.dto.one.OneDTO;

import java.util.List;

public interface OneSerivce {

    void oneinsert(OneDTO oneDTO);

    int getuid(String id);

    List<OneDTO> onelist();

    OneDTO oneDetail(int ono);

    void oneDetailinsert(OneDTO dto);

    void onedelete(int ono);
}
