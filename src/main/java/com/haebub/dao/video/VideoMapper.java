package com.haebub.dao.video;

import com.haebub.dto.video.VideoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VideoMapper {
    List<VideoDTO> videoResult(int lid);

    VideoDTO lecTitle(int lid);
}
