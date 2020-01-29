package com.reyoung.dao;

import com.reyoung.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by yangtao on 2019-12-30.
 */
@Repository("userDao")
public interface UserDao {

    public Integer addaccount(User user);

    public Integer findnamexit(User user);

    public User checkdologin(User user);

    public User finduserbyname(User user);

    public Integer updatepas(User user);

}
