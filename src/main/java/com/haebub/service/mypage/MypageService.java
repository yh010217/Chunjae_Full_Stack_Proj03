package com.haebub.service.mypage;

import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;

import java.util.List;

public interface MypageService {

    /** 강의 목록 */
    List<LectureListDTO> getLectureList(int uid);
    List<LectureListDTO> getLectureList2(int uid);

    /** 로그인한 사용자 uid 가져오기 */
    int getUid(String id);

    /** 결재 내역 */
    List<PaidDTO> getPaidList(int uid);

    /** 회원 정보 */
    UserDTO getUser(int uid);

    /** 회원 정보 수정 */
    int userModify(UserDTO dto);
}
