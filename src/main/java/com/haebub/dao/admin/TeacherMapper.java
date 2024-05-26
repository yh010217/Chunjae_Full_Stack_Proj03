package com.haebub.dao.admin;

import com.haebub.dto.admin.TeacherDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {

    /** 강사 uid 가져오기 */
    int getTUid(String id);

    /** 강사 정보 등록 */
    int teacherRegister(TeacherDTO dto);

    /** user 테이블에 usertype 선생님으로 업데이트 */
    int updateUsertype(int uid);

    /** 선생님 uid 존재 여부*/
    int isUidExist(int uid);

    /** 강사 리스트 */
    List<TeacherDTO> getTeacherList();
}
