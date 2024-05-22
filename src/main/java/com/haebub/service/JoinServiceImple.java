package com.haebub.service;

import com.haebub.dao.JoinMapper;
import com.haebub.dto.UserDTO;
import com.haebub.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Service(value = "JoinService")
public class JoinServiceImple implements JoinService {

   private final JoinMapper joinMapper;

   @Autowired
   public JoinServiceImple(JoinMapper joinMapper){
      this.joinMapper=joinMapper;
   }


   @Override
   public void joinresult(UserDTO dto) throws Exception{
         joinMapper.joinresult(dto);
   }


   @Override
   public int checkId(String id) {
      int result=0;
      result=joinMapper.checkId(id);
      return result;
   }

   @Override
   public int checkEmail(String email) {
      return joinMapper.checkEmail(email);
   }
   @Override
   public int checkNick(String nickname) {
      return joinMapper.checkNick(nickname);
   }


   @Override
   public int login(String id, String pwd) {
      int result=0;
      result=joinMapper.login(id,pwd);
      return result;
   }

   @Override
   public String logincheck(UserDTO dto, HttpSession session) {
      String name=joinMapper.logincheck(dto);
      if (!name.equals("0")){

         session.setAttribute("id",dto.getId());
         session.setAttribute("name",name);
         return name;
      }
      return null;
   }


//   @Override
//   public int idcheck(UserDTO dto) throws Exception {
//      int result=joinMapper.idcheck(dto);
//      return result;
//   }


}

