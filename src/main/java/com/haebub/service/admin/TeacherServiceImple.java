package com.haebub.service.admin;

import com.haebub.dao.admin.TeacherMapper;
import com.haebub.dto.admin.TeacherDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeacherServiceImple implements TeacherService{

    private final TeacherMapper teacherMapper;

    /** 선생님 uid 가져오기 */
    @Override
    public int getTuid(String id) {
        return teacherMapper.getTUid(id);
    }

    /** 강사 등록 */
    @Override
    public int teacherRegister(TeacherDTO dto) {
        return teacherMapper.teacherRegister(dto);
    }

    /** user 테이블에 usertype 선생님으로 업데이트 */
    @Override
    public int updateUsertype(int uid) {
        return teacherMapper.updateUsertype(uid);
    }
}
