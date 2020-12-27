package com.akso.modules.akso.controller;

import com.akso.modules.akso.domain.BaseResponse;
import com.akso.modules.akso.domain.RecordDto;
import com.akso.modules.akso.param.ExportParam;
import com.akso.modules.akso.dto.RecordDetail;
import com.akso.modules.akso.service.QuestionService;
import com.alibaba.fastjson.JSONObject;
import io.lettuce.core.dynamic.annotation.Param;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author xiongwu
 **/
@RequestMapping("/api")
@RestController
@Slf4j
public class RecordController {

    @Autowired
    private QuestionService questionService;

    @PostMapping("/record/commit")
    public BaseResponse commit(@RequestBody RecordDto recordDto){
        //注册时校验
        log.info(JSONObject.toJSONString(recordDto));
        questionService.commit(recordDto);
        return  new BaseResponse();
    }
    @GetMapping("/record/get")
    public ResponseEntity<RecordDetail> getRecord(@Param("id")Integer id){
        return new ResponseEntity<>(questionService.getRecord(id), HttpStatus.OK);
    }

    @PostMapping("/record/export")
    public void exportRecord(HttpServletRequest request, HttpServletResponse response, @RequestBody ExportParam exportParam){
        questionService.export(request, response, exportParam);
    }

}
