package com.forest.wu.utils.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器
 *
 * @author 蒋梓伦
 * @create 2018-10-10 16:07
 **/

@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

    @Bean
    SysInterceptor sysUserLoginInterceptor() {
        return new SysInterceptor();
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        // 映射为 user 的控制器下的所有映射
        registry.addInterceptor(sysUserLoginInterceptor()).addPathPatterns("/")
                .excludePathPatterns("/log/**","/statics/**","/indexBootstrap/**");
        super.addInterceptors(registry);
    }

}
