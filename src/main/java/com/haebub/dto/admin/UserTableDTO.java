package com.haebub.dto.admin;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserTableDTO {
    private String id;
    private String name;
    private String email;
    private String joindate;
    private String sp_uid;
}
