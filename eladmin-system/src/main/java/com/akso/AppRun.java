/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.akso;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import com.akso.annotation.rest.AnonymousGetMapping;
import com.akso.utils.SpringContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.lang.reflect.Field;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 开启审计功能 -> @EnableJpaAuditing
 *
 * @author Zheng Jie
 * @date 2018/11/15 9:20:19
 */
@EnableAsync
@RestController
@Api(hidden = true)
@SpringBootApplication
@EnableTransactionManagement
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
@EnableScheduling
public class AppRun implements WebMvcConfigurer {

    public static void main(String[] args) {
        SpringApplication.run(AppRun.class, args);
    }

    @Bean
    public SpringContextHolder springContextHolder() {
        return new SpringContextHolder();
    }

    @Bean
    public ServletWebServerFactory webServerFactory() {
        TomcatServletWebServerFactory fa = new TomcatServletWebServerFactory();
        fa.addConnectorCustomizers(connector -> connector.setProperty("relaxedQueryChars", "[]{}"));
        return fa;
    }

    @Autowired
    private RestTemplateBuilder builder;
    @Autowired
    private ObjectMapper objectMapper;
    @Bean
    public RestTemplate restTemplate() {

        RestTemplate restTemplate = builder.build();

        List<HttpMessageConverter<?>> messageConverters = Lists.newArrayList();
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setObjectMapper(objectMapper);

        //不加可能会出现异常
        //Could not extract response: no suitable HttpMessageConverter found for response type [class ]

        MediaType[] mediaTypes = new MediaType[]{
                MediaType.APPLICATION_JSON,
                MediaType.APPLICATION_OCTET_STREAM,

                MediaType.TEXT_HTML,
                MediaType.TEXT_PLAIN,
                MediaType.TEXT_XML,
                MediaType.APPLICATION_STREAM_JSON,
                MediaType.APPLICATION_ATOM_XML,
                MediaType.APPLICATION_FORM_URLENCODED,
                MediaType.APPLICATION_JSON_UTF8,
                MediaType.APPLICATION_PDF,
        };

        converter.setSupportedMediaTypes(Arrays.asList(mediaTypes));

        try {
            //通过反射设置MessageConverters
            Field field = restTemplate.getClass().getDeclaredField("messageConverters");

            field.setAccessible(true);

            List<HttpMessageConverter<?>> orgConverterList = (List<HttpMessageConverter<?>>) field.get(restTemplate);

            Optional<HttpMessageConverter<?>> opConverter = orgConverterList.stream()
                    .filter(x -> x.getClass().getName().equalsIgnoreCase(MappingJackson2HttpMessageConverter.class
                            .getName()))
                    .findFirst();

            if (opConverter.isPresent() == false) {
                return restTemplate;
            }

            messageConverters.add(converter);//添加MappingJackson2HttpMessageConverter

            //添加原有的剩余的HttpMessageConverter
            List<HttpMessageConverter<?>> leftConverters = orgConverterList.stream()
                    .filter(x -> x.getClass().getName().equalsIgnoreCase(MappingJackson2HttpMessageConverter.class
                            .getName()) == false)
                    .collect(Collectors.toList());

            messageConverters.addAll(leftConverters);

            System.out.println(String.format("【HttpMessageConverter】原有数量：%s，重新构造后数量：%s"
                    , orgConverterList.size(), messageConverters.size()));

        } catch (Exception e) {
            e.printStackTrace();
        }

        restTemplate.setMessageConverters(messageConverters);


        return restTemplate;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        Iterator<HttpMessageConverter<?>> iterator = converters.iterator();
        while(iterator.hasNext()){
            HttpMessageConverter<?> converter = iterator.next();
            if(converter instanceof MappingJackson2HttpMessageConverter){
                iterator.remove();
            }
        }
        FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
        FastJsonConfig config = new FastJsonConfig();
        config.setSerializerFeatures(SerializerFeature.WriteNullListAsEmpty, // List类型字段为null时输出[]而非null
                SerializerFeature.WriteMapNullValue, // 显示空字段
                SerializerFeature.WriteNullStringAsEmpty, // 字符串类型字段为null时间输出""而非null
                SerializerFeature.WriteNullBooleanAsFalse, // Boolean类型字段为null时输出false而null
                SerializerFeature.PrettyFormat, // 美化json输出，否则会作为整行输出
                SerializerFeature.WriteNullNumberAsZero, // 数值字段如果为null,输出为0,而非null
                SerializerFeature.WriteNullBooleanAsFalse, // Boolean字段如果为null,输出为false,而非null
                SerializerFeature.WriteDateUseDateFormat, // 时间格式yyyy-MM-dd HH: mm: ss
                SerializerFeature.DisableCircularReferenceDetect);  // 禁用循环引用检测
        converter.setFastJsonConfig(config);
        converters.add(converter);
        List<MediaType> supportedMediaTypes = new ArrayList<>();
        supportedMediaTypes.add(MediaType.APPLICATION_JSON);
        supportedMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
        supportedMediaTypes.add(MediaType.APPLICATION_ATOM_XML);
        supportedMediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);
        supportedMediaTypes.add(MediaType.APPLICATION_OCTET_STREAM);
        supportedMediaTypes.add(MediaType.APPLICATION_PDF);
        supportedMediaTypes.add(MediaType.APPLICATION_RSS_XML);
        supportedMediaTypes.add(MediaType.APPLICATION_XHTML_XML);
        supportedMediaTypes.add(MediaType.APPLICATION_XML);
        supportedMediaTypes.add(MediaType.IMAGE_GIF);
        supportedMediaTypes.add(MediaType.IMAGE_JPEG);
        supportedMediaTypes.add(MediaType.IMAGE_PNG);
        supportedMediaTypes.add(MediaType.TEXT_EVENT_STREAM);
        supportedMediaTypes.add(MediaType.TEXT_HTML);
        supportedMediaTypes.add(MediaType.TEXT_MARKDOWN);
        supportedMediaTypes.add(MediaType.TEXT_PLAIN);
        supportedMediaTypes.add(MediaType.TEXT_XML);
        converter.setSupportedMediaTypes(supportedMediaTypes);
    }

    /**
     * 访问首页提示
     *
     * @return /
     */
    @AnonymousGetMapping("/")
    public String index() {
        return "Backend service started successfully";
    }
}
