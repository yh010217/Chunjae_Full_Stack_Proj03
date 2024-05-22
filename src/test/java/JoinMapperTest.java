
import com.haebub.dao.join.JoinMapper;
import com.haebub.dto.UserDTO;
//import com.haebub.service.join.JoinServiceImple;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class JoinMapperTest {

    @Autowired
    private JoinMapper joinMapper;

    @Test
    public void test123(){
        System.out.println("\n\n\n\n\n joinMapper \n\n\n\n\n\n");
        assertNotNull(joinMapper);
    }

    @Transactional
    @Test
    public void JoinMapper() throws Exception{

        Assertions.assertNotNull(joinMapper);
        UserDTO dto=new UserDTO();

        dto.setId("test");
        dto.setPwd("test");
        dto.setName("test");
        dto.setNickname("test");
        dto.setEmail("test@test.com");
        dto.setTel("010-2222-2222");
        dto.setBirthday("2222.02.02");
        dto.setUsertype(0);
        dto.setJoindate("2024-05-21");
        dto.setAddr("test");
        dto.setSp_uid("test");
        joinMapper.joinresult(dto);
        //assertEquals(1,joinMapper.joinresult(dto));
    }

//    @Test
//    public void test(){
//        UserDTO dto = new UserDTO();
//        dto.setId("test");
//        System.out.println(joinMapper.idcheck(dto));
//        assertEquals(1,joinMapper.idcheck(dto));
//    }

//    @Autowired
//    private JoinService service;
//
//    @Test
//    @Transactional
//    public void test1(){
//       // assertNotNull(service);
//        HashMap<String,Object> o=new HashMap<>();
//        o.put("id","test");
//        o.put("pwd","test");
//        o.put("name","test");
//        o.put("nickname","test");
//        o.put("addr","test");
//        o.put("tel","010-2222-2222");
//        o.put("birthday","1998-02-02");
//        o.put("usertype",0);
//        o.put("joindate","2024-05-21");
//
//        assertEquals(1,service.joinresult(o));
//    }


}
*/
