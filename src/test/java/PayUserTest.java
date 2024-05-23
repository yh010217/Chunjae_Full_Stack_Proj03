import com.haebub.dao.pay.PayUserMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class PayUserTest {

    @Autowired
    private PayUserMapper mapper;

    @Test
    public void test1(){
        Assertions.assertNotNull(mapper);
    }
    @Test
    public void test2(){
        System.out.println(mapper.getUid("test342"));
        Assertions.assertEquals("559",mapper.getUid("test342").get(0));
    }

    @Test
    public void test3(){

        System.out.println(mapper.getLec("40"));
    }


}
