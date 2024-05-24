import com.haebub.dao.admin.TeacherMapper;
import com.haebub.dto.admin.TeacherDTO;
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
public class TeacherTest {

    @Autowired
    private TeacherMapper teacherMapper;

    @Test
    public void test1() {
        assertNotNull(teacherMapper.getTUid("test"));
        assertEquals(7, teacherMapper.getTUid("test") );
    }

    @Test
    public void test2(){
        TeacherDTO dto = new TeacherDTO();
        dto.setTsubject("영어");
        dto.setTintro("안녕하세요");
        dto.setTprofile("사진사진");
        dto.setUid(7);
        assertEquals(1,teacherMapper.teacherRegister(dto));
    }

    @Test
    public void test3(){
        assertEquals(1, teacherMapper.updateUsertype(28));
    }

}
