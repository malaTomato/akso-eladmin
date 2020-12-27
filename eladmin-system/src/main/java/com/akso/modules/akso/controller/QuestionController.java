package com.akso.modules.akso.controller;

import com.akso.modules.akso.entity.QuestionRecordEntity;
import com.akso.modules.akso.domain.QuestionResponse;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.service.QuestionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author xiongwu
 **/
@Slf4j
@RestController
@RequestMapping("/api")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/question/getQuestion")
    public QuestionResponse getQuestion(@RequestParam("id") Integer id){
        return questionService.getQuestion(id);
    }

    @PostMapping("/question/queryQuestionRecord")
    public ResponseEntity<Page<QuestionRecordEntity>> queryQuestionRecord(@RequestBody RecordParam recordParam){
        return new ResponseEntity(questionService.queryQuestionRecord(recordParam), HttpStatus.OK);
    }
}
