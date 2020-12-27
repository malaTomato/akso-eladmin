package com.akso.modules.akso.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.akso.modules.akso.domain.AccessTokenResponse;
import com.akso.modules.akso.entity.AksoUser;
import com.akso.modules.akso.repository.AksoUserMapper;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

/**
 * @author xiongwu
 **/
@Component
@Slf4j
public class TaskJob {

    @Autowired
    private AksoUserMapper aksoUserMapper;

    @Autowired
    private MessageService messageService;

    @Value("${wx.url}")
    private String wxUrl;

    @Value("${wx.appId}")
    private String appId;

    @Value("${wx.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @Scheduled(cron = "0 0 8 * * ?")
    public void sendMessage(){
        LocalDate yesterday = LocalDate.now().minusDays(1L);
        LocalDateTime start = LocalDateTime.of(yesterday, LocalTime.MIN);
        LocalDateTime end = LocalDateTime.of(yesterday,LocalTime.MAX);

        List<AksoUser> aksoUsers = aksoUserMapper.findByOperationDateBetween(start,end);
        if (aksoUsers == null || CollectionUtil.isEmpty(aksoUsers)){
            log.info("暂时没有用户需要发送消息");
            return;
        }
        String accessToken = getAccessToken();
        for (AksoUser aksoUser : aksoUsers){
            messageService.sendMessage2User(accessToken,aksoUser);
        }
    }

    private String getAccessToken(){

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(wxUrl).append("cgi-bin/token?grant_type=client_credential&appid=");
        stringBuilder.append(appId).append("&secret=").append(secret);
        log.info("获取token 请求为:{}",stringBuilder.toString());
        AccessTokenResponse tokenResponse = restTemplate.getForObject(stringBuilder.toString(), AccessTokenResponse.class);
        if (tokenResponse ==null){
            log.error("获取token失败响应为：{}", JSONObject.toJSONString(tokenResponse));
            throw new RuntimeException("获取token失败");
        }
        return tokenResponse.getAccess_token();
    }
}
