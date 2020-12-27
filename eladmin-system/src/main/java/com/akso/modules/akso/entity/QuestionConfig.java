package com.akso.modules.akso.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

/**
 * @author xiongwu
 **/
@Entity
@Table(name="tb_question_config")
@Data
public class QuestionConfig {
    @Id
    @Column(name = "id")
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    private String config;
}
