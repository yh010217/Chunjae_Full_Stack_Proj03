package com.haebub.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PayTableDTO {
    private String ltitle;
    private String ptime;
    private String lprice;
    private String sp_ocode;
    private String user;
}
