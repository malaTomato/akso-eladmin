package com.akso.modules.akso.repository;

import com.akso.modules.akso.entity.Information;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface InformationMapper extends JpaRepository<Information, Integer>, JpaSpecificationExecutor<Information> {

    @Modifying
    @Query("update Information set status = ?2 where id = ?1")
    void updateStatusById(Integer id,Integer status);
}
