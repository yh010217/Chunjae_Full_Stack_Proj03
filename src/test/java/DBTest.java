import com.haebub.dao.PaymentMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class DBTest {

    @Autowired
    private PaymentMapper mapper;

    @Test
    public void test1(){
        Assertions.assertNotNull(mapper);
    }
    @Test
    public void test2(){
        Assertions.assertEquals("hello",mapper.getList().get(0));
    }


}
