package com.akso.modules.akso.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * @author xiongwu
 **/
@Entity
@Table(name="tb_user")
@Data
public class AksoUser {
    @Id
    @Column(name = "id")
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String username;
    private String nickname;
    private String phone;
    private LocalDateTime operationDate;
    private String openId;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
