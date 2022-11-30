package com.xuuxxi.happyold.utils;

import java.util.UUID;

/**
 * @Author: Xuuxxi
 * @Date: 2022/11/28
 */
public class NameUtil {
    public static String getNewName(String name){
        String suffix = name.substring(name.lastIndexOf("."));

        return UUID.randomUUID() + suffix;
    }
}
