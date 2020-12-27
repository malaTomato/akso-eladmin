package com.akso.modules.akso.param;

import lombok.Data;

import java.util.Date;

/**
 * @author xiongwu
 **/
@Data
public class RecordParam {
    private String openId;
    private String username;
    private String mobile;
    private String startTime;
    private String endTime;
    private Integer pageSize;
    private Integer pageIndex;
}
