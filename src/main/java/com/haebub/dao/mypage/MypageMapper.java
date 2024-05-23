package com.haebub.dao.mypage;

import com.haebub.dto.mypage.LectureListDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MypageMapper {

    /* 강의 목록 */
    List<LectureListDTO> lectureListDtos(int uid);

    /* 사용자 uid */
    int getUid(String id);
}
