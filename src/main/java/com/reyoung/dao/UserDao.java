package com.reyoung.dao;

import com.reyoung.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public User findepartmanager();

    public User findwenjianfuzeren();

    public List<User> findunitbyuser(User user);

}
