package com.akso.modules.akso.controller;

import com.akso.modules.akso.domain.*;
import com.akso.modules.akso.dto.HomeDto;
import com.akso.modules.akso.entity.AksoUser;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.service.AksoUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author xiongwu
 **/
@RestController
@RequestMapping("/api")
@Slf4j
public class AksoUserController {

    @Autowired
    private AksoUserService aksoUserService;

    @GetMapping("/user/getAuthUser")
    public WXSessionResponse getAuthUser(@RequestParam("code") String code){
        log.info("current Code:{}",code);
        return aksoUserService.getOpenId(code);
    }

    @GetMapping("/user/home")
    public ResponseEntity<HomeDto> home(){
        return new ResponseEntity<>(aksoUserService.home(),HttpStatus.OK) ;
    }


    @GetMapping("/user/getInfo")
    public ResponseEntity<String> getInfo(@RequestParam("id") Integer id){
        log.info("current Code:{}",id);
        return new ResponseEntity<>(aksoUserService.getInfo(id), HttpStatus.OK);
    }

    @GetMapping("/user/userPage")
    public UserPageDto userPage(@RequestParam("openId") String openId){
        return aksoUserService.userPage(openId);
    }



    @PostMapping("/user/register")
    public AksoUser register(@RequestBody UserDto userDto){
        //注册时校验
        return aksoUserService.register(userDto);
    }


    @PostMapping("/user/updateOperationDate")
    public UserDto updateOperationDate(@RequestBody UserDto userDto){
        return aksoUserService.updateOperationDate(userDto);
    }

    @PostMapping("/user/queryUserPage")
    public ResponseEntity<Page<AksoUser>> queryUserPage(@RequestBody RecordParam userDto){
        return new ResponseEntity<>(aksoUserService.queryUserPage(userDto), HttpStatus.OK);
    }
}
