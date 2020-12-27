package com.akso.modules.akso.dto;

import com.akso.modules.akso.domain.Option;
import lombok.Data;

import java.util.List;

/**
 * @author xiongwu
 **/
@Data
public class QuestionDto {
    private String title;
    private String type;
    private List<Option> options;

}
