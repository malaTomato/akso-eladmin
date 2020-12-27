package com.akso.modules.akso.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * @author xiongwu
 **/
@Entity
@Table(name="tb_question_record")
@Data
public class QuestionRecordEntity {
    @Id
    @Column(name = "id")
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String openId;
    private String record;
    private Integer configId;
    private String username;
    private String phone;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    @Transient
    private String title;
}
