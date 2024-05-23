package com.haebub.service.mypage;

import com.haebub.dto.mypage.LectureListDTO;

import java.util.List;

public interface MypageService {

    /* 강의 목록 */
    List<LectureListDTO> getLectureList(int uid);

    /* 로그인한 사용자 uid 가져오기 */
    int getUid(String id);
}
