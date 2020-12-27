package com.akso.modules.akso.entity;

import com.akso.base.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author xiongwu
 **/
@Entity
@Table(name="tb_info")
@Data
public class Information implements Serializable {
    @Id
    @Column(name = "id")
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    private String link;
    private String content;
}
