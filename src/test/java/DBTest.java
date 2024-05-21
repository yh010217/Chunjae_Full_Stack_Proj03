import com.haebub.controller.admin.AdminController;
import com.haebub.dao.PaymentMapper;
import com.haebub.dao.admin.ChartTestMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class DBTest {

    @Autowired
    private PaymentMapper mapper;

    @Test
    public void test1(){
        assertNotNull(mapper);
    }
    @Test
    public void test2(){
        assertEquals("hello",mapper.getList().get(0));
    }

    @Autowired
    private ChartTestMapper chartTestMapper;
    @Test
    public void test3(){
        System.out.println(chartTestMapper);
        assertNotNull(chartTestMapper);
    }
    @Test
    public void test4(){
        assertEquals(253,chartTestMapper.georgiCount());
    }

    @Test
    public void test5(){
        System.out.println(chartTestMapper.getHireChart());
    }


}
