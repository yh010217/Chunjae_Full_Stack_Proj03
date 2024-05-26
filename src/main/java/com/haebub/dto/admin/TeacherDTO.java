package com.haebub.dto.admin;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
public class TeacherDTO {
    private int tid;
    private String tsubject;
    private String tprofile;
    private String tintro;
    private int uid;
    private MultipartFile file;
    private String id;
    private String name;
}
