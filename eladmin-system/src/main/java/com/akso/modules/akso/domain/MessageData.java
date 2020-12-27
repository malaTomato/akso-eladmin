package com.akso.modules.akso.domain;

import com.akso.modules.akso.dto.MessageDto;
import lombok.Data;

/**
 * @author xiongwu
 **/
@Data
public class MessageData {
    /**
     *提醒人
     */
    private MessageDto name1;
    /**
     *提醒日期
     */
    private MessageDto date2;
    /**
     *提醒事项
     */
    private MessageDto thing3;
    /**
     *事项地点
     */
    private MessageDto thing4;
    /**
     *备注
     */
    private MessageDto thing9;

}
