package com.air.service;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * create at: 11-3-16
 *
 * @author Yonghui Chen
 */
@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = {ElementType.CONSTRUCTOR, ElementType.FIELD, ElementType.METHOD})
public @interface AirAutowired {
    boolean required() default true;
}
