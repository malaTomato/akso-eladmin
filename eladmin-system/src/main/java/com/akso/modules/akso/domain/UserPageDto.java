package com.akso.modules.akso.domain;

import lombok.Data;

import java.util.List;

/**
 * @author xiongwu
 **/
@Data
public class UserPageDto {
    private UserDto user;
    private List<QuestionDto> questionDtoList;
    private List<InformationDto> informationDtoList;
    private Boolean flag;
}
