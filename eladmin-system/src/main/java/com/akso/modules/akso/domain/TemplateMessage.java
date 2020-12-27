package com.akso.modules.akso.domain;

import lombok.Data;

/**
 * @author xiongwu
 **/
@Data
public class TemplateMessage {
    //用户openid
    private String touser;

    //模板消息ID
    private String template_id;
    private String appid;

    //详情跳转页面
    private String url;

    private Miniprogram miniprogram;

    //模板数据封装实体
    private MessageData data;
}
