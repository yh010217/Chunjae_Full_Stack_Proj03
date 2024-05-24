package com.haebub.dto.video;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class VideoDTO {
    private int vid;
    private String vtitle; // 동영상 제목
    private String vlink; // 동영상 링크
    private int lid; // 어느 강의인지 연결하기
    private String ltitle; // 강의 제목
    private int lcount; // 강의 수
    private MultipartFile file;
}
