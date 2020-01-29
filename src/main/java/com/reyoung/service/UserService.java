package com.reyoung.service;

import com.reyoung.model.User;

/**
 * Created by yangtao on 2019-12-30.
 */
public interface UserService {

    public Integer addaccount(User user);

    public Integer findnamexit(User user);

    public User checkdologin(User user);

    public User finduserbyname(User user);

    public Integer updatepas(User user);

}
