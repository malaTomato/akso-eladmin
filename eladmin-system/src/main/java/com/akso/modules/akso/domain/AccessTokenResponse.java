package com.akso.modules.akso.domain;

import lombok.Data;

/**
 * @author xiongwu
 **/
@Data
public class AccessTokenResponse {
    private String access_token;
    private String expires_in;
    private String errcode;
    private String errmsg;
}
