package com.haebub.dao.admin;


import com.haebub.dto.User.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface UserMapper {




    List<UserDTO> list(HashMap<String, Object> li);

    int totalCount(HashMap<String, Object> hm);


    int getUid(String id);

    UserDTO getUser(int uid);


    UserDTO adminmodify(int uid);


    void adminmodifyresult(UserDTO dto);


    void deleteUser(int uid);


}
