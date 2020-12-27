package com.akso.modules.akso.repository;

import com.akso.modules.akso.entity.Information;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface InformationMapper extends JpaRepository<Information, Integer>, JpaSpecificationExecutor<Information> {
}
