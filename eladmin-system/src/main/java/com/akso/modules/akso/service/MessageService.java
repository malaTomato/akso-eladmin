package com.akso.modules.akso.service;

import com.akso.modules.akso.config.TemplateConfig;
import com.akso.modules.akso.domain.AccessTokenResponse;
import com.akso.modules.akso.domain.MessageData;
import com.akso.modules.akso.domain.TemplateMessage;
import com.akso.modules.akso.domain.WXSessionResponse;
import com.akso.modules.akso.dto.MessageDto;
import com.akso.modules.akso.entity.AksoUser;
import com.akso.modules.akso.repository.AksoUserMapper;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.format.DateTimeFormatter;

/**
 * @author xiongwu
 **/
@Service
@Slf4j
public class MessageService {


    @Value("${wx.url}")
    private String wxUrl;
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private TemplateConfig templateConfig;

    private final static String SUCCESS_CODE = "0";

    public void sendMessage2User(String token,AksoUser aksoUser){
        log.info("开始给{},{}发送消息通知",aksoUser.getOpenId(),aksoUser.getUsername());

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(wxUrl).append("cgi-bin/message/subscribe/send?access_token=");
        stringBuilder.append(token);
        TemplateMessage templateMessage = buildMessage(aksoUser);
        log.info("请求发送模板消息接口，url:{},param:{}",stringBuilder.toString(), JSONObject.toJSONString(templateMessage));
        WXSessionResponse wxSessionResponse = restTemplate.postForObject(stringBuilder.toString(), templateMessage, WXSessionResponse.class);
        log.info("请求发送模板消息接口响应为：{}",JSONObject.toJSONString(wxSessionResponse));
    }

    private TemplateMessage buildMessage(AksoUser aksoUser){

        TemplateMessage templateMessage = new TemplateMessage();
        templateMessage.setTemplate_id(templateConfig.getId());
        templateMessage.setAppid(templateConfig.getAppid());
        templateMessage.setTouser(aksoUser.getOpenId());

        MessageData messageData = new MessageData();
        //用户名称
        messageData.setName1(new MessageDto(aksoUser.getUsername()));
        messageData.setDate2(new MessageDto(aksoUser.getOperationDate().format(DateTimeFormatter.ISO_DATE)));
        messageData.setThing3(new MessageDto("复查时间提醒"));
        messageData.setThing4(new MessageDto("湖南省儿童医院"));
        messageData.setThing9(new MessageDto("请带好医疗卡"));

        templateMessage.setData(messageData);
        return templateMessage;
    }

}
