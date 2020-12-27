package com.akso.modules.akso.domain;

import lombok.Data;

/**
 * @author xiongwu
 **/
@Data
public class UserDto {
    private String openid;
    private String username;
    private String phone;
    private String operationDate;
    private String nickname;
    private String reviewDate;

}
