package com.haebub.service;

import com.haebub.dto.UserDTO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

public interface JoinService {

    public void joinresult(UserDTO dto) throws Exception;



//    int idCheck(UserDTO dto);

    int checkId(String id);
    int checkEmail(String email);

    int login(String id, String pwd);

    String logincheck(UserDTO dto, HttpSession session);

    int checkNick(String nickname);
}
