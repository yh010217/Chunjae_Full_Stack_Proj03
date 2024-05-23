package com.haebub.service.video;

import com.haebub.dao.video.VideoMapper;
import com.haebub.dto.video.VideoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImple implements VideoService{

    private final VideoMapper mapper;
    @Autowired
    public VideoServiceImple(VideoMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<VideoDTO> videoResult(int lid) {
        return mapper.videoResult(lid);
    }

    @Override
    public VideoDTO lecTitle(int lid) {
        return mapper.lecTitle(lid);
    }
}
