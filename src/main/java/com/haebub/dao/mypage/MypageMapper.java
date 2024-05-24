package com.haebub.dao.mypage;

import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MypageMapper {

    /** 강의 목록 */
    List<LectureListDTO> lectureListDtos(int uid);
    List<LectureListDTO> lectureListDtos2(int uid);


    /** 사용자 uid */
    int getUid(String id);

    /** 결제 내역 */
    List<PaidDTO> paidList(int uid);

    /** 회원 정보 가져오기*/
    UserDTO getUser(int uid);

    /** 회원 정보 수정 */
    int userModify(UserDTO dto);
}
