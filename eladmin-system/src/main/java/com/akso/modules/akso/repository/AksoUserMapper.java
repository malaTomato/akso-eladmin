package com.akso.modules.akso.repository;

import com.akso.modules.akso.entity.AksoUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface AksoUserMapper extends JpaRepository<AksoUser, Long>, JpaSpecificationExecutor<AksoUser> {

    AksoUser findByOpenId(@Param("openId") String openId);

    List<AksoUser> findByOperationDateBetween(LocalDateTime start,LocalDateTime end);
}
