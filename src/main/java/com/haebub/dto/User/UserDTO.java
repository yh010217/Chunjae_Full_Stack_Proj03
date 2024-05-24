package com.haebub.dto.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter @Getter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private int uid;
    private String id;
    private String pwd;
    private String name;
    private String nickname;
    private String addr;
    private String tel;
    private String email;
    private String birthday;

    // 관리자, 선생님 구분(0:회원, 1:관리자, 2: 선생님)
    private int usertype;
    private String joindate;
    private String sp_uid;


}
