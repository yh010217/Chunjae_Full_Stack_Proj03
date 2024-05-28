package com.haebub.service.join;

import com.haebub.dao.join.JoinMapper;
import com.haebub.dto.User.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service/*(value = "JoinService")*/
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
   public String logincheck(UserDTO dto) {
      String name=joinMapper.logincheck(dto);
      System.out.println(name+"eee");
        return name;
    }


//   @Override
//   public int idcheck(UserDTO dto) throws Exception {
//      int result=joinMapper.idcheck(dto);
//      return result;
//   }


}

