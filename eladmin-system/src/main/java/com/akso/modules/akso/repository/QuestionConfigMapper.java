package com.akso.modules.akso.repository;

import com.akso.modules.akso.entity.QuestionConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface QuestionConfigMapper extends JpaRepository<QuestionConfig, Integer>, JpaSpecificationExecutor<QuestionConfig> {
    List<QuestionConfig> findByIdIn(List<Integer> ids);
}
