package com.haebub.service.video;

import com.haebub.dao.video.VideoMapper;
import com.haebub.dto.video.VideoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

    @Override
    public void insertVideo(String path, VideoDTO dto, int lid) throws IOException {

        if(dto.getFile() != null) {
            String fnames = fileUpload(path, dto);
            System.out.println("fnames >>> " + fnames);
            dto.setVlink(fnames);
        }

        HashMap<String, Object> hm = new HashMap<>();
        hm.put("lid", lid);
        hm.put("vtitle", dto.getVtitle());
        hm.put("vlink", dto.getVlink());
        hm.put("file", dto.getFile());

        mapper.insertVideo(hm);
    }

    @Override
    public int lid(int lid) {
        return mapper.lid(lid);
    }


    // 비디오 링크 따와야 함...!!!!!!!!
    @Override
    public String link(VideoDTO dto, int lid) {
        HashMap<String, Object> o = new HashMap<>();
        o.put("lid", lid);
        o.put("vlink", dto.getVlink());
        o.put("vtitle", dto.getVtitle());
        return mapper.link(o);
    }

    private String fileUpload(String path, VideoDTO dto) {
        UUID uuid = UUID.randomUUID();

        String fname = dto.getFile().getOriginalFilename();
        fname = URLEncoder.encode(fname, StandardCharsets.UTF_8).replace("+", "%20");
        String filename = uuid + "_" + fname;
        File saveFile = new File(path, filename);

        try {
            dto.getFile().transferTo(saveFile);
        } catch (IOException e) {
            saveFile.delete();
            throw  new RuntimeException();
        }
        return filename;
    }
}
