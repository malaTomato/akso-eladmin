package com.akso.modules.akso.service;

import cn.hutool.core.collection.CollectionUtil;
import com.akso.modules.akso.domain.*;
import com.akso.modules.akso.dto.HomeDto;
import com.akso.modules.akso.entity.AksoUser;
import com.akso.modules.akso.entity.Information;
import com.akso.modules.akso.entity.QuestionConfig;
import com.akso.modules.akso.entity.QuestionRecordEntity;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.repository.AksoUserMapper;
import com.akso.modules.akso.repository.InformationMapper;
import com.akso.modules.akso.repository.QuestionConfigMapper;
import com.akso.modules.akso.repository.QuestionRecordMapper;
import com.akso.utils.DateUtil;
import com.akso.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.persistence.criteria.Predicate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.stream.Collectors;

/**
 * @author xi
 * ongwu
 **/
@Service
@Slf4j
public class AksoUserService {

    @Value("${wx.appId}")
    private String appId;

    @Value("${wx.secret}")
    private String secret;
    @Value("${wx.url}")
    private String wxUrl;

    @Autowired
    private InformationMapper informationMapper;

    @Autowired
    private AksoUserMapper aksoUserMapper;

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private QuestionConfigMapper questionConfigMapper;
    @Autowired
    private QuestionRecordMapper questionRecordMapper;


    public WXSessionResponse getOpenId(String code) {
        //获取openId
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sns/jscode2session?appid=").append(appId).append("&secret=").append(secret).append("&js_code=").append(code).append("&grant_type=authorization_code");
        WXSessionResponse entity = restTemplate.getForObject(wxUrl + stringBuilder.toString(), WXSessionResponse.class);
        log.info("调用微信获取 auth.code2Session 接口响应为:{}", JSONObject.toJSONString(entity));
        if (entity == null) {
            throw new RuntimeException("查询失败");
        }
        //查询openId
        AksoUser aksoUser = aksoUserMapper.findByOpenId(entity.getOpenid());
        if (aksoUser == null) {
            log.info("新用户，需要进行注册");
            entity.setRegisterFlag(true);
        }
        return entity;
    }

    public UserPageDto userPage(String openId) {
        UserPageDto userPageDto = new UserPageDto();
        List<QuestionDto> questionDtoList = getQuestionList(openId);
        List<InformationDto> informationDtoList = getInformationList();

        userPageDto.setInformationDtoList(informationDtoList);
        userPageDto.setQuestionDtoList(questionDtoList);
        userPageDto.setUser(getUser(openId));
        userPageDto.setFlag(getFlag());
        return userPageDto;
    }

    private Boolean getFlag() {
        return false;
    }

    private UserDto getUser(String openId) {
        AksoUser user = aksoUserMapper.findByOpenId(openId);
        UserDto userDto = new UserDto();
        userDto.setOpenid(user.getOpenId());
        userDto.setOperationDate(DateUtil.localDateTimeFormat(user.getOperationDate(), "yyyy-MM-dd"));
        userDto.setReviewDate(DateUtil.localDateTimeFormat(user.getOperationDate().plusMonths(1), "yyyy-MM-dd"));
        userDto.setPhone(user.getPhone());
        userDto.setUsername(user.getUsername());
        return userDto;
    }

    private List<InformationDto> getInformationList() {
        List<InformationDto> list = new ArrayList<>();
        List<Information> all = informationMapper.findAll();
        all.forEach(v -> list.add(new InformationDto(v.getId(), v.getTitle())));
        return list;
    }

    private List<QuestionDto> getQuestionList(String openId) {

        List<QuestionDto> questionDtos = new ArrayList<>();
        List<QuestionConfig> questionConfigs = questionConfigMapper.findAll();
        questionConfigs.forEach(v -> questionDtos.add(new QuestionDto(v.getId(), v.getTitle())));

        List<QuestionRecordEntity> recordEntities = questionRecordMapper.findByOpenId(openId);
        if (CollectionUtil.isNotEmpty(recordEntities)) {
            List<Integer> collect = recordEntities.stream().map(QuestionRecordEntity::getConfigId).distinct().collect(Collectors.toList());
            return questionDtos.stream().filter(v -> !collect.contains(v.getId())).collect(Collectors.toList());
        }
        return questionDtos;
    }

    public UserDto updateOperationDate(UserDto userDto) {
        AksoUser aksoUser = aksoUserMapper.findByOpenId(userDto.getOpenid());
        aksoUser.setOperationDate(DateUtil.parseLocalDateFormat(userDto.getOperationDate(), "yyyy-MM-dd"));
        aksoUserMapper.save(aksoUser);
        userDto.setReviewDate(DateUtil.localDateTimeFormat(aksoUser.getOperationDate().plusMonths(1), "yyyy-MM-dd"));
        return userDto;
    }

    public AksoUser register(UserDto userDto) {
        AksoUser user = aksoUserMapper.findByOpenId(userDto.getOpenid());
        if (user != null) {
            return user;
        }
        AksoUser aksoUser = new AksoUser();
        aksoUser.setOpenId(userDto.getOpenid());
        aksoUser.setUsername(userDto.getUsername());
        aksoUser.setOperationDate(DateUtil.parseLocalDateFormat(userDto.getOperationDate(), "yyyy-MM-dd"));
        aksoUser.setPhone(userDto.getPhone());
        aksoUser.setNickname(userDto.getNickname());
        aksoUser.setCreateTime(LocalDateTime.now());
        aksoUser.setUpdateTime(LocalDateTime.now());
        return aksoUserMapper.save(aksoUser);
    }

    public Page<AksoUser> queryUserPage(RecordParam recordParam) {
        Pageable pageable = new PageRequest(recordParam.getPageIndex(), recordParam.getPageSize());
        Page<AksoUser> userMapperAll = aksoUserMapper.findAll((Specification<AksoUser>) (root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> list = new ArrayList<>();
            if (StringUtils.isNotBlank(recordParam.getUsername())) {
                list.add(criteriaBuilder.equal(root.get("username").as(String.class), recordParam.getUsername()));
            }
            if (StringUtils.isNotBlank(recordParam.getMobile())) {
                list.add(criteriaBuilder.equal(root.get("phone").as(String.class), recordParam.getMobile()));
            }
            Predicate[] p = new Predicate[list.size()];
            return criteriaBuilder.and(list.toArray(p));
        }, pageable);
        return userMapperAll;
    }

    public String getInfo(Integer id) {
        return informationMapper.findById(id).get().getContent();
    }

    public HomeDto home() {
        HomeDto homeDto = new HomeDto();
        homeDto.setUsers(aksoUserMapper.count());
        homeDto.setRecords(questionRecordMapper.count());
        homeDto.setNews(informationMapper.count());
        return homeDto;
    }
}
