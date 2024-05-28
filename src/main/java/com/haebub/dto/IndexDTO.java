package com.haebub.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class IndexDTO {
    private String lprofile;
    private String lgrade;
    private String ltitle;
    private int lprice;
    private int lid;
    private int uid;
    private int tid;
    private String tprofile;
    private String tsubject;
    private String tintro;
    private String name;
}
