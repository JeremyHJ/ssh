package com.cyyt.bookhouse.util;/**
 * Created by 胡杰 on 2017/11/26.
 */

import com.mchange.v2.lang.StringUtils;

/**
 * Copyright (C), 2011-2017 {company}
 * FileName: com.cyyt.bookhouse.util.StringUtil.java
 * Author: Jeremy_Hu
 * Date: 2017/11/26 下午3:54
 * <Author>      <Time>    <version>    <desc>
 * {xxx}   下午3:54    1.0          Create
 */
public class StringUtil {

    public static  Boolean isNotBlank(String str){
        String str1 = "";
        if(str.length()>0&&str!=null){
            str1 = str.trim();
        }
        return str1.length()>0?true:false;


    }
}
