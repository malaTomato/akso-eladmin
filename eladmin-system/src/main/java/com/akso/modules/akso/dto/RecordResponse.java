package com.akso.modules.akso.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author xiongwu
 **/
@Data
public class RecordResponse {
    private Integer id;
    private String username;
    private String phone;
    private LocalDateTime createTime;
    private String recordTitle;
    private Integer recordId;
}
