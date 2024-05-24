package com.haebub.service.admin;

import com.haebub.dto.admin.TeacherDTO;

public interface TeacherService {

    /** 선생님 uid 가져오기 */
    int getTuid(String id);

    /** 강사 등록 */
    int teacherRegister(TeacherDTO dto);

    /** user 테이블에 usertype 선생님으로 업데이트 */
    int updateUsertype(int uid);
}
