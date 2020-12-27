package com.akso.modules.akso.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author xiongwu
 **/
@Configuration
@ConfigurationProperties(prefix = "template")
@Data
public class TemplateConfig {
    private String id;
    private String no;
    private String appid;
}
