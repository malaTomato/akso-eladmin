package com.akso.modules.akso.domain;

import lombok.Data;

import java.util.List;

/**
 * @author xiongwu
 **/
@Data
public class Question {
    private Integer id;
    private String title;
    private String type;
    private List<Option> options;
    private String answer;
    private String placeholder;
}
