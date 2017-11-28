package com.cyyt.bookhouse.controller;/**
 * Created by 胡杰 on 2017/10/2.
 */

import com.cyyt.bookhouse.pojo.User;
import com.cyyt.bookhouse.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Copyright (C), 2011-2017 {company}
 * FileName: com.cyyt.bookhouse.controller.UserController.java
 * Author: Jeremy_Hu
 * Date: 2017/10/2 上午5:36
 * <Author>      <Time>    <version>    <desc>
 * {xxx}   上午5:36    1.0          Create
 */
@Controller
@RequestMapping("/user")
public class UserController {

    //service类
    @Autowired
    private UserService userService;

    /**
     * 查找所用用户控制器方法
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUser.do")
    public ModelAndView findUser()throws Exception{
        ModelAndView modelAndView = new ModelAndView();

        //调用service方法得到用户列表
        List<User> users = this.userService.findUser();
        //将得到的用户列表内容添加到ModelAndView中
        modelAndView.addObject("users",users);
        //设置响应的jsp视图
        modelAndView.setViewName("findUser");

        return modelAndView;
    }

    @RequestMapping("/login.do")
    public ModelAndView login(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String  a= request.getParameter("seacher['aa']");
        //调用service方法得到用户列表
        Map map=request.getParameterMap();
        Set keSet=map.entrySet();
        for(Iterator itr = keSet.iterator(); itr.hasNext();){
            Map.Entry me=(Map.Entry)itr.next();
            Object ok=me.getKey();
            Object ov=me.getValue();
            String[] value=new String[1];
            if(ov instanceof String[]){
                value=(String[])ov;
            }else{
                value[0]=ov.toString();
            }

            for(int k=0;k<value.length;k++){
                System.out.println(ok+"="+value[k]);
            }
        }

        List<User> users = this.userService.findUser();
        //将得到的用户列表内容添加到ModelAndView中
        modelAndView.addObject("users",users);
        //设置响应的jsp视图
        modelAndView.setViewName("/user/login");

        return modelAndView;

    }

    @RequestMapping("/verify.do")
    public void verify()throws Exception{


    }
}