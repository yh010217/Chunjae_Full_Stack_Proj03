import com.haebub.dao.one.OneMapper;
import com.haebub.dto.one.OneDTO;
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
public class OneTest {
@Autowired
    private OneMapper oneMapper;

@Transactional
@Test
    public void test1(){
    //assertNotNull(oneMapper);
    OneDTO dto=new OneDTO();

    dto.setUid(6);
    dto.setRegdate("2024-05-03");
    dto.setLid(1);
    dto.setOcontent("test");
    dto.setOtitle("Test");
    dto.setOsecret(true);
    oneMapper.oneinsert(dto);

}

}
