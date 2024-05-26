package com.haebub.service.admin;

import com.haebub.dto.admin.TeacherDTO;

import java.util.List;

public interface TeacherService {

    /** 강사 등록 */
    void teacherRegister(String realpath, TeacherDTO dto) throws Exception;

    /** 강사 리스트*/
    List<TeacherDTO> teacherList();


}
