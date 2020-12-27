package com.akso.modules.akso.dto;
import com.akso.modules.akso.domain.Question;
import lombok.Data;

import java.util.List;

/**
 * @author xiongwu
 **/
@Data
public class RecordDetail {
    private String title;
    private List<Question> questions;
}
