package com.haebub.service.video;

import com.haebub.dto.video.VideoDTO;

import java.util.List;

public interface VideoService {
    List<VideoDTO> videoResult(int lid);

    VideoDTO lecTitle(int lid);
}
