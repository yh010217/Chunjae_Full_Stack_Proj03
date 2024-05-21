import com.haebub.dao.comingsoon.CalendarMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;


@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class CalendarTest {

    @Autowired
    private CalendarMapper calendarMapper;

    @Test
    public void test1(){
        assertNotNull(calendarMapper);
    }

    @Test
    public void test2(){
        assertEquals("2수학이야",calendarMapper.calList().get(1).getLtitle());
    }

    @Test
    public void test3(){
        assertEquals("2024-05-21",calendarMapper.calList().get(0).getLopendate());
    }


}
