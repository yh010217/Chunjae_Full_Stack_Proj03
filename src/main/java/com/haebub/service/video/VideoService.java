package com.haebub.service.video;

import com.haebub.dto.video.VideoDTO;

import java.io.IOException;
import java.util.List;

public interface VideoService {
    List<VideoDTO> videoResult(int lid);

    VideoDTO lecTitle(int lid);

    void insertVideo(String realpath, VideoDTO dto, int lid) throws IOException;

    int lid(int lid);

    String link(VideoDTO dto, int lid);
}
