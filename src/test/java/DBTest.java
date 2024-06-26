import com.haebub.dao.admin.ChartMapper;
import com.haebub.dao.admin.ChartTestMapper;
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

    @Autowired
    private ChartMapper chartMapper;

    @Test
    public void test6(){
        assertNotNull(chartMapper);
    }
    @Test
    public void test7(){
        System.out.println(chartMapper.getUserChart());
    }
}
