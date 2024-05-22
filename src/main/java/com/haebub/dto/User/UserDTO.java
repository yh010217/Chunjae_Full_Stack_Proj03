package com.haebub.dto.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

//@Setter @Getter
//@AllArgsConstructor
//@NoArgsConstructor
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

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getUsertype() {
        return usertype;
    }

    public void setUsertype(int usertype) {
        this.usertype = usertype;
    }

    public String getJoindate() {
        return joindate;
    }

    public void setJoindate(String joindate) {
        this.joindate = joindate;
    }

    public String getSp_uid() {
        return sp_uid;
    }

    public void setSp_uid(String sp_uid) {
        this.sp_uid = sp_uid;
    }

    public UserDTO(int uid, String id, String pwd, String name, String nickname, String addr, String tel, String email, String birthday, int usertype, String joindate, String sp_uid) {
        this.uid = uid;
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.nickname = nickname;
        this.addr = addr;
        this.tel = tel;
        this.email = email;
        this.birthday = birthday;
        this.usertype = usertype;
        this.joindate = joindate;
        this.sp_uid = sp_uid;
    }

    public UserDTO() {
    }

}
