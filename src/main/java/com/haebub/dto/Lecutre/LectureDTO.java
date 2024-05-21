package com.haebub.dto.Lecutre;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;


@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class LectureDTO {
    private int lid;
    private String ltitle; // 강의 제목
    private String lintro; // 강의 소개
    private String lbook; // 강의 책
    private int lprice; // 강의 가격
    private String lopendate; // 오픈일자
    private int lperiod; // 기간
    private int lcount; // 강의 수
    private String lprofile; // 썸네일
    private int tid;
    private String sp_pcode; // 상품코드
    private String sp_pplan; // 가격 계획
    private MultipartFile multipartFile; // ㅎ...
    private String lgrade; // 학년
}
