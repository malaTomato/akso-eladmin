package com.akso.modules.akso.domain;

import lombok.Data;

/**
 * @author xiongwu
 **/
@Data
public class WXSessionResponse {

    private String openid;
    private String session_key;
    private String unionid;
    /**
     * 注册标识
     */
    private Boolean registerFlag;
    private Integer errcode;
    private String errmsg;
    private String msgid;
}
