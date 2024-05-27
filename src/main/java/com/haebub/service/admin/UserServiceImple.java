package com.haebub.service.admin;

import com.haebub.dao.admin.UserMapper;
import com.haebub.dto.User.UserDTO;
import lombok.RequiredArgsConstructor;
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

    @Override
    public int getUid(String id) {
        return userMapper.getUid(id);
    }

    @Override
    public UserDTO getUser(int uid) {
        return userMapper.getUser(uid);
    }

    @Override
    public UserDTO adminmodify(int uid) {
        return userMapper.adminmodify(uid);
    }

    @Override
    public void adminmodifyresult(UserDTO dto) {
        userMapper.adminmodifyresult(dto);
    }

    @Override
    public void deleteUser(int uid) {
        userMapper.deleteUser(uid);
    }

    @Override
    public int checkNick(String nickname) {
        return userMapper.checkNick(nickname);
    }


}
