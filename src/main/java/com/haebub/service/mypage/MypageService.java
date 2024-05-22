package com.haebub.service.mypage;

import com.haebub.dto.mypage.LectureListDTO;

import java.util.List;

public interface MypageService {

    List<LectureListDTO> getLectureList(int uid);

}
