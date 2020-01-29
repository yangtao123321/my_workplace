package com.reyoung.multidatasource;

import java.lang.annotation.*;

/**
 * 此处用于定义DataSource注解，通过注解的方式指定需要访问的数据源
 * @author:lujingyu
 * @data:2018年9月17日下午2:10:54
 */
@Documented
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface DataSource {
    String value();
}
