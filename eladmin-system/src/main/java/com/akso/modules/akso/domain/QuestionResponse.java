package com.akso.modules.akso.domain;

import lombok.Data;

import java.util.List;

/**
 * @author xiongwu
 **/
@Data
public class QuestionResponse {
    private Integer id;
    private String name;
    private List<Question> questions;
}
