package com.haebub.dto.mypage;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class LectureListDTO {
    private int lid;
    private String ltitle;
    private String startDate;
    private String endDate;
    private String tsubject;
    private String name;
    private String now;
    private String status;
}
