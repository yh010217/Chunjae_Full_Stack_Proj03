import com.haebub.dao.comingsoon.CalendarMapper;
import com.haebub.dao.mypage.MypageMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;


@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
public class MypageTest {

    @Autowired
    private MypageMapper mypageMapper;

    @Test
    public void test1(){
        assertNotNull(mypageMapper.lectureListDtos(7));
        assertEquals("단어특강~가자~",mypageMapper.lectureListDtos(7).get(1).getLtitle());
    }

    @Test
    public void test2(){
        assertEquals(7,mypageMapper.getUid("test"));
    }

}
