package com.haebub.service.mypage;

import com.haebub.dao.mypage.MypageMapper;
import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.LectureListDTO;
import com.haebub.dto.mypage.PaidDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("lecturelist")
@RequiredArgsConstructor
public class MypageServiceImple implements MypageService {

    private final MypageMapper mypageMapperr;

    /** 강의 목록 */
    @Override
    public List<LectureListDTO> getLectureList(int uid) {
        return mypageMapperr.lectureListDtos(uid);
    }
    @Override
    public List<LectureListDTO> getLectureList2(int uid) {
        return mypageMapperr.lectureListDtos2(uid);
    }

    /** 사용자 uid 가져오기 */
    @Override
    public UserDTO getUid(String id) {
        return mypageMapperr.getUid(id);
    }

    /** 결재 내역 */
    @Override
    public List<PaidDTO> getPaidList(int uid) {
        return mypageMapperr.paidList(uid);
    }

    /** 회원 정보 */
    @Override
    public UserDTO getUser(int uid) {
        return mypageMapperr.getUser(uid);
    }

    /** 회원 정보 수정 */
    @Override
    public int userModify(UserDTO dto) {
        return mypageMapperr.userModify(dto);
    }

    /** 닉네임 중복 체크 */
    @Override
    public int CheckNickname(int uid) {
        return mypageMapperr.CheckNickname(uid);
    }
}
