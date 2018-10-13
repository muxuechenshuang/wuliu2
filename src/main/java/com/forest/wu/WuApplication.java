package com.forest.wu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.forest.wu.dao")
public class WuApplication {

    public static void main(String[] args) {
        SpringApplication.run(WuApplication.class, args);
    }

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 9:58 2018/9/30
     * JSON配置(fastjson)
     */

//    @Bean
//    public HttpMessageConverters fastJsonHttpMessageConverters() {
//        FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
//        FastJsonConfig fastJsonConfig = new FastJsonConfig();
//        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
//
//        //日期格式化
//        fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm:ss");
//        converter.setFastJsonConfig(fastJsonConfig);
//        return new HttpMessageConverters(converter);
//    }




}
