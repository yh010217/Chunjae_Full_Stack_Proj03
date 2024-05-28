import com.haebub.controller.admin.AdminController;
import com.haebub.dao.comingsoon.CalendarMapper;
import com.haebub.dao.mypage.MypageMapper;
import com.haebub.dto.User.UserDTO;
import com.haebub.service.admin.ChartService;
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
@Transactional
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

    @Test
    public void test3(){
       assertEquals("2024-05-30",mypageMapper.paidList(7).get(1).getStartDate());
    }


    @Autowired
    ChartService chartService;
    @Test
    public void test4(){
        System.out.println(chartService.getPayChart());
    }

}
