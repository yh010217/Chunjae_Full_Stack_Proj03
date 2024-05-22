package com.haebub.service.mypage;

import com.haebub.dao.mypage.MypageMapper;
import com.haebub.dto.mypage.LectureListDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("lecturelist")
@RequiredArgsConstructor
public class MypageServiceImple implements MypageService {

    private final MypageMapper lectureListMapper;

    @Override
    public List<LectureListDTO> getLectureList(int uid) {
        return lectureListMapper.lectureListDtos(uid);
    }
}
