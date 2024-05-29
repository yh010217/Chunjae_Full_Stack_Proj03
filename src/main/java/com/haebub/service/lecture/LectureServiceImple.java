package com.haebub.service.lecture;

import com.haebub.dao.Lecture.LectureMapper;
import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.User.UserDTO;
import com.haebub.dto.mypage.PaidDTO;
import com.haebub.dto.video.VideoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
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
    @Transactional
    public List<LectureDTO> freeList() {
        return lecMapper.freeList();
    }

    @Override // 디테일 화면에서 강의 리스트 출력하기
    public List<VideoDTO> video(int lid) {
        return lecMapper.video(lid);
    }

    @Override // 선생님 아이디 알아오기
    public String tec_id(int lid) {
        return lecMapper.tec_id(lid);
    }

    @Override
    public String id(HashMap<String, Object> o) {
        return lecMapper.id(o);
    }

    @Override // uid 알아오기
    public int uid(String id) {
        return lecMapper.uid(id);
    }

    @Override
    public int lecDelete(int lid) {
        return lecMapper.lecDelete(lid);
    }

    @Override // 그 뭐냐,,, 그,,, 검색 기능
    public List<LectureDTO> searchResult(String search) {
        return lecMapper.searchResult(search);
    }

    @Override
    public int lecCount(int lid) {
        return lecMapper.lecCount(lid);
    }

    @Override
    public int getOpenDate(int lid) {
        return lecMapper.getOpenDate(lid);
    }

    @Override
    public int getVideoCount(int lid) {
        return lecMapper.getVideoCount(lid);
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
        int lid = lecMapper.getLid();
        dto.setLid(lid);
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
