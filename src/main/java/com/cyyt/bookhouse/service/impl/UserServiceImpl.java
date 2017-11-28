package com.cyyt.bookhouse.service.impl;/**
 * Created by 胡杰 on 2017/10/2.
 */

import com.cyyt.bookhouse.mapper.UserMapper;
import com.cyyt.bookhouse.pojo.User;
import com.cyyt.bookhouse.service.UserService;
import com.cyyt.bookhouse.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;


import java.io.Serializable;
import java.util.List;
import java.util.logging.Logger;

/**
 * Copyright (C), 2011-2017 {company}
 * FileName: com.cyyt.bookhouse.service.impl.UserServiceImpl.java
 * Author: Jeremy_Hu
 * Date: 2017/10/2 上午5:34
 * <Author>      <Time>    <version>    <desc>
 * {xxx}   上午5:34    1.0          Create
 */
@Service
public class UserServiceImpl implements UserService,Serializable {
    //User接口
    @Autowired
    private UserMapper userMapper;

    public List<User> findUser() throws Exception {
        //调用mapper类中的selectByExample方法，如果传入类型为null，则表示无条件查找
        List<User> users = userMapper.selectByExample(null);
        return users;
    }

    public User queryUser(User user) throws  Exception{

        if(StringUtil.isNotBlank(user.getId().toString())) {
            User user1 = userMapper.selectByPrimaryKey(Integer.parseInt(user.getId().toString()));
        }else {
            System.out.print("用户信息输入为空！");
        }
        return user;
    }

    public User updata(User user) throws Exception {
        return null;
    }

    public User save(User user) throws Exception {
        return null;
    }

}