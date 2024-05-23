package com.haebub.dao.pay;

import java.util.HashMap;
import java.util.List;

public interface PayUserMapper {
    HashMap<String,Object>  getUid(String id);

    HashMap<String,Object> getLec(String lid);
}
