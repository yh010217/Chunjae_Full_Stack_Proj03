package com.haebub.service.lecture;

import com.haebub.dao.Lecture.LectureMapper;
import com.haebub.dto.Lecutre.LectureDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Service(value = "lecService")
public class LectureServiceImple implements LectureService {

    private final LectureMapper lecMapper;
    @Autowired
    public LectureServiceImple(LectureMapper lecMapper) {
        this.lecMapper = lecMapper;
    }

    @Override
    public List<LectureDTO> lectureList() {
        List<LectureDTO> list = lecMapper.lectureList();
        return list;
    }

    // 디테일
    @Override
    public LectureDTO lecDatail(int lid) {
        LectureDTO dto = lecMapper.lecDatail(lid);
        return dto;
    }

    @Override
    public List<LectureDTO> freeList() {
        return lecMapper.freeList();
    }

    @Override
    public void insertData(String path, LectureDTO dto) throws IOException {
        if(dto.getFile() != null) {
            String fnames = fileUpload(path, dto);
            System.out.println("path >> " + path);
            dto.setLprofile(fnames);
            System.out.println("fnames : " + fnames);
        }
        lecMapper.insertData(dto);
    }

    private String fileUpload(String path, LectureDTO dto) {
        UUID uuid = UUID.randomUUID();

        String fname = dto.getFile().getOriginalFilename();
        System.out.println("original name : " + fname);
        fname = URLEncoder.encode(fname, StandardCharsets.UTF_8).replace("+", "%20");
        String filename = uuid + "_" + fname;
        System.out.println(filename + " >> filename");
        File saveFile = new File(path, filename);

        try {
            dto.getFile().transferTo(saveFile);
        } catch (IOException e) {
            saveFile.delete();
            throw new RuntimeException();
        }
        return filename;
    }

}
