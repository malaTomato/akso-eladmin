package com.akso.modules.akso.repository;


import com.akso.modules.akso.entity.QuestionRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuestionRecordMapper extends JpaRepository<QuestionRecordEntity, Integer>, JpaSpecificationExecutor<QuestionRecordEntity> {
    List<QuestionRecordEntity> findByOpenId(@Param("openId") String openId);
}
