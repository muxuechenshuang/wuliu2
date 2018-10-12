package com.forest.wu.utils.interceptor;

import java.lang.annotation.*;

/**
 * @author 蒋梓伦
 * @create 2018-10-11 14:30
 **/
    @Inherited
    @Target({ElementType.TYPE, ElementType.METHOD})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    public @interface Auth {
        String value();
    }

