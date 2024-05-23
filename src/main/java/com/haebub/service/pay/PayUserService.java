package com.haebub.service.pay;

import java.util.HashMap;
import java.util.List;

public interface PayUserService {

    HashMap<String,Object> getUid(String id);

    HashMap<String,Object> getLec(String lid);
}
