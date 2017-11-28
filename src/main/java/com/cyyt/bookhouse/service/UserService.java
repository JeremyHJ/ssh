package com.cyyt.bookhouse.service;

import com.cyyt.bookhouse.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 胡杰 on 2017/10/2.
 */

public interface UserService {
    List<User> findUser()throws Exception;

    User queryUser(User user)throws Exception;

    User updata(User user)throws  Exception;

    User save(User user)throws  Exception;


}
