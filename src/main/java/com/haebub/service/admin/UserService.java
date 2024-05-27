package com.haebub.service.admin;

import com.haebub.dto.User.UserDTO;

import java.util.List;

public interface UserService {




    int totalCount(String search, String searchtxt);


    List<UserDTO> userDTOList(int startrow, int pagesize, String search, String searchtxt);



    int getUid(String id);

    UserDTO getUser(int uid);


    UserDTO adminmodify(int uid);


    void adminmodifyresult(UserDTO dto);


    void deleteUser(int uid);

    int checkNick(String nickname);
}
