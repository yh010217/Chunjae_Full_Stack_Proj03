package com.haebub.service.teacher;

import com.haebub.dao.teacher.TeacherMapper2;
import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TeacherServiceImple2 implements TeacherService{
    private final TeacherMapper2 mapper;

    @Override
    public List<TeacherDTO> getlist() {
        return mapper.getList();
    }

    @Override
    public TeacherDTO getdetailList(int tid) {
        return mapper.getDetailList(tid);
    }

    @Override // insert 하기...
    public void insertData(String path, LectureDTO dto, int tid) throws IOException{

        HashMap<String, Object> o = new HashMap<>();

        if(dto.getFile() != null) {
            String fnames = fileUpload(path, dto);
            dto.setLprofile(fnames);
        }

        o.put("ltitle", dto.getLtitle());
        o.put("lprofile", dto.getLprofile());
        o.put("lintro", dto.getLintro());
        o.put("lbook", dto.getLbook());
        o.put("lprice", dto.getLprice());
        o.put("lopendate", dto.getLopendate());
        o.put("lperiod", dto.getLperiod());
        o.put("lcount", dto.getLcount());
        o.put("tid", tid);
        o.put("lgrade", dto.getLgrade());
        mapper.insertData(o);

        int lid = mapper.getLid();
        dto.setLid(lid);
    }

    @Override // tid 뽑기
    public int getTid(int tid) {
        return mapper.getTid(tid);
    }

    @Override
    public TeacherDTO getInfo(int tid) {
        return mapper.getInfo(tid);
    }

    @Override
    public List<LectureDTO> getLecList(int tid) {
        return mapper.getLecList(tid);
    }

    @Override
    public int getCount(int tid) {
        return mapper.getTotal(tid);
    }

    private String fileUpload(String path, LectureDTO dto) {
        UUID uuid = UUID.randomUUID();

        String fname = dto.getFile().getOriginalFilename();

        // 파일 이름이 null인 경우 예외 처리
        if (fname == null) {
            throw new RuntimeException("File name is null");
        }

        fname = URLEncoder.encode(fname, StandardCharsets.UTF_8).replace("+", "%20");
        String filename = uuid + "_" + fname;

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
