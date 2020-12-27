package com.akso;

import com.akso.modules.akso.service.MessageService;
import com.akso.modules.akso.service.TaskJob;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author xiongwu
 **/
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class MessageTest {
    @Autowired
    MessageService messageService;

    @Autowired
    TaskJob taskJob;

    @Test
    public void test(){
        taskJob.sendMessage();
    }

}
