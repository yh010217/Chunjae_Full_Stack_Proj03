package com.haebub.dao.join;

import com.haebub.dto.User.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
//회원가입
public void joinresult(UserDTO dto);

//    int idcheck(UserDTO dto);

    public boolean selectId(String id); //중복 Id 검색


    int checkId(String id);

    int login(String id, String pwd);

    String logincheck(UserDTO dto);

    int checkEmail(String email);

    int checkNick(String nickname);
}
