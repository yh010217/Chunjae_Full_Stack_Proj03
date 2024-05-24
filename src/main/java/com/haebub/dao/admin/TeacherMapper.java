package com.haebub.dao.admin;

import com.haebub.dto.admin.TeacherDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherMapper {

    /** 강사 uid 가져오기 */
    int getTUid(String id);

    /** 강사 정보 등록 */
    int teacherRegister(TeacherDTO dto);

    /** user 테이블에 usertype 선생님으로 업데이트 */
    int updateUsertype(int uid);
}
