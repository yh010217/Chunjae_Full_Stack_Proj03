package com.haebub.dto.one;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class OneDTO {

    private String otitle;
    private String ocontent;
    private String oregdate;
    private boolean osecret;
    private int uid;
    private int lid;

    private String oans;

    private String owriter;


}
