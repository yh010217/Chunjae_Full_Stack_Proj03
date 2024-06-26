package com.haebub.service.mypage;

import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;
import com.haebub.dto.one.OneDTO;

import java.util.List;

public interface MypageService {

    /** 수강중인 강의 목록 */
    List<LectureListDTO> getLectureList(int uid);

    /** 수강완료 강의 목록 */
    List<LectureListDTO> getLectureList2(int uid);

    /** 로그인한 사용자 정보 가져오기 */
    UserDTO getUid(String id);

    /** 결재 내역 */
    List<PaidDTO> getPaidList(int uid);

    /** 회원 정보 */
    UserDTO getUser(int uid);

    /** 회원 정보 수정 */
    int userModify(UserDTO dto);

    /** 닉네임 중복 체크 */
    int CheckNickname(String nickname);
  
    /** 일대일 게시판*/
    List<OneDTO> getoneList(int uid);

    

}
