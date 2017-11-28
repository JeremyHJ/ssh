package com.cyyt.bookhouse.util;/**
 * Created by 胡杰 on 2017/10/3.
 */

/**
 * Copyright (C), 2011-2017 {company}
 * FileName: com.cyyt.bookhouse.util.CommUtil.java
 * Author: Jeremy_Hu
 * Date: 2017/10/3 下午2:51
 * <Author>      <Time>    <version>    <desc>
 * {xxx}   下午2:51    1.0          Create
 */


import java.util.Random;

/**
 * 通用工具类
 */
public class CommUtil {

    public static final String randomInt(int length) {
        if (length < 1) {
            return null;
        }
        Random randGen = new Random();
        char[] numbersAndLetters = "0123456789".toCharArray();

        char[] randBuffer = new char[length];
        for (int i = 0; i < randBuffer.length; i++) {
            randBuffer[i] = numbersAndLetters[randGen.nextInt(10)];
        }

        return new String(randBuffer);
    }

    public static String null2String(Object s) {
        return s == null ? "" : s.toString().trim();
    }
}
