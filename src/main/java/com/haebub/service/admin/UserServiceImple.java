package com.haebub.service.admin;

import com.haebub.dao.admin.UserMapper;
import com.haebub.dto.User.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImple implements UserService{

    private final UserMapper userMapper;




    @Override
    public int totalCount(String search, String searchtxt) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("search",search);
        hm.put("searchtxt",searchtxt);
        return userMapper.totalCount(hm);
    }



    @Override
    public List<UserDTO> userDTOList(int startrow, int pagesize, String search, String searchtxt) {
        HashMap<String,Object> li=new HashMap<>();
        li.put("startrow",startrow);
        li.put("pagesize",pagesize);
        li.put("search",search);
        li.put("searchtxt",searchtxt);

        List<UserDTO> list=userMapper.list(li);
        return list;

    }



}
