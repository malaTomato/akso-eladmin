package com.akso.modules.akso.service;

import cn.hutool.core.collection.CollectionUtil;
import com.akso.modules.akso.entity.Information;
import com.akso.modules.akso.entity.QuestionRecordEntity;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.repository.InformationMapper;
import com.akso.utils.StringUtils;
import com.alipay.api.domain.UserInfomation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Predicate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xiongwu
 **/
@Service
public class InfoService {
    @Autowired
    private InformationMapper informationMapper;

    public Page<Information> queryPage(RecordParam recordParam) {
        Pageable pageable = new PageRequest(recordParam.getPageIndex(), recordParam.getPageSize(), Sort.Direction.ASC, "id");

        Page<Information> bookPage = informationMapper.findAll((Specification<Information>) (root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> list = new ArrayList<>();
//            if (StringUtils.isNotBlank(recordParam.getOpenId())){
//                list.add(criteriaBuilder.equal(root.get("openId").as(String.class),recordParam.getOpenId()));
//            }
//            if (StringUtils.isNotBlank(recordParam.getUsername())){
//                list.add(criteriaBuilder.equal(root.get("username").as(String.class),recordParam.getUsername()));
//            }
//            if (StringUtils.isNotBlank(recordParam.getMobile())){
//                list.add(criteriaBuilder.equal(root.get("phone").as(String.class),recordParam.getMobile()));
//            }
//            if (StringUtils.isNotBlank(recordParam.getStartTime())){
//                list.add(criteriaBuilder.between(root.get("createTime").as(String.class),recordParam.getStartTime(),recordParam.getEndTime()));
//            }
            Predicate[] p = new Predicate[list.size()];
            return criteriaBuilder.and(list.toArray(p));
        },pageable);
        return bookPage;
    }

    public Boolean delete(Integer id) {
        informationMapper.deleteById(id);
        return true;
    }

    public Boolean save(Information information) {
        information.setCreateTime(LocalDateTime.now());
        information.setStatus(0);
        information.setUpdateTime(LocalDateTime.now());
        informationMapper.save(information);
        return true;
    }

    public Boolean edit(Information userInfomation) {
        informationMapper.updateStatusById(userInfomation.getId(),userInfomation.getStatus());
        return true;
    }
}
