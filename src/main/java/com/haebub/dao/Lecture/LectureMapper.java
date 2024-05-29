package com.haebub.dao.Lecture;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.video.VideoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface LectureMapper {
    void insertData(LectureDTO dto);
    List<LectureDTO> lectureList();

    LectureDTO lecDatail(int lid);

    int getLid();
    List<LectureDTO> freeList();

    List<VideoDTO> video(int lid);

    String tec_id(int lid);

    String id(HashMap<String, Object> o);

    int uid(String id);

    int lecDelete(int lid);

    List<LectureDTO> searchResult(String search);

    int lecCount(int lid);

    int getOpenDate(int lid);

    int getVideoCount(int lid);
}
