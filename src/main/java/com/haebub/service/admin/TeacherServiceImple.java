package com.haebub.service.admin;

import com.haebub.dao.admin.TeacherMapper;
import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TeacherServiceImple implements TeacherService{

    private final TeacherMapper teacherMapper;

    /** 선생님 uid 존재 여부 확인*/
    public boolean isUidExist(int uid) {

        int count = teacherMapper.isUidExist(uid);
        // count 가 0보다 크면 true
        return count > 0;
    }

    /** 강사 등록 */
    @Override
    @Transactional
    public void teacherRegister(String path, TeacherDTO dto) {
        if(dto.getFile() != null) {
            String fnames = fileUpload(path, dto);
            System.out.println("path :" + path);
            dto.setTprofile(fnames);
            System.out.println("fnames : " + fnames);
        }

        // 예외 처리 화면에 보이게 처리해야함 !!!!!!
        Integer uid = teacherMapper.getTUid(dto.getId()); // Integer로 변경하여 null을 처리할 수 있도록 함
        if (uid == null) {
            // user에 uid가 존재하지 않을 때 예외 처리
            throw new RuntimeException("존재하지 않는 id : " + dto.getId());
        }

        // teacher에 uid가 존재하는지 확인
        if (!isUidExist(uid)) {
            dto.setUid(uid);
            // uid가 존재하지 않는 경우에만 등록 처리
            System.out.println("-----uid 받아와서 처리-------");
            teacherMapper.teacherRegister(dto);
            System.out.println("-----teacher insert 완료-------");
            teacherMapper.updateUsertype(uid);
            System.out.println("-----usertype update 완료-------");

        } else {
            // uid가 이미 존재
            System.out.println("uid가 이미 존재합니다: " + uid);

        }

    }

    /** 강사 리스트 */
    @Override
    public List<TeacherDTO> teacherList() {
        return teacherMapper.getTeacherList();
    }

    /** 파일 업로드 */
    private String fileUpload(String path, TeacherDTO dto) {
        UUID uuid = UUID.randomUUID();

        String fname = dto.getFile().getOriginalFilename();
        System.out.println("original name : " + fname);
        fname = URLEncoder.encode(fname, StandardCharsets.UTF_8).replace("+", "%20");
        String filename = uuid + "_" + fname;
        System.out.println("filename : " + filename);
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
