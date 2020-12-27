package com.akso.modules.akso.controller;

import com.akso.modules.akso.entity.Information;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.service.InfoService;
import com.alipay.api.domain.UserInfomation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author xiongwu
 **/
@RestController
@RequestMapping("/api/info")
public class InfoController {

    @Autowired
    private InfoService infoService;

    @PostMapping("/queryPage")
    public ResponseEntity<Page<Information>> queryPage(@RequestBody RecordParam recordParam) {
        return new ResponseEntity<>(infoService.queryPage(recordParam), HttpStatus.OK);
    }

    @GetMapping("/delete")
    public ResponseEntity<Boolean> delete(@RequestParam("id")Integer id){
        infoService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Boolean> add(@RequestBody Information userInfomation){
        return new ResponseEntity<>(infoService.save(userInfomation),HttpStatus.OK);
    }

    @PostMapping("/edit")
    public ResponseEntity<Boolean> edit(@RequestBody Information userInfomation){
        return new ResponseEntity<>(infoService.edit(userInfomation),HttpStatus.OK);
    }


}
