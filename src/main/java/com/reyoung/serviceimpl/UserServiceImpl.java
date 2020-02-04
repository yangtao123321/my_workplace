package com.reyoung.serviceimpl;

import com.reyoung.dao.UserDao;
import com.reyoung.model.User;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
@Service("userService")
@DataSource("dataSource")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;

    @Override
    public Integer addaccount(User user) {
        return userDao.addaccount(user);
    }

    @Override
    public Integer findnamexit(User user) {
        return userDao.findnamexit(user);
    }

    @Override
    public User checkdologin(User user) {
        return userDao.checkdologin(user);
    }

    @Override
    public User finduserbyname(User user) {
        return userDao.finduserbyname(user);
    }

    @Override
    public Integer updatepas(User user) {
        return userDao.updatepas(user);
    }

    @Override
    public User findepartmanager() {
        return userDao.findepartmanager();
    }

    @Override
    public User findwenjianfuzeren() {
        return userDao.findwenjianfuzeren();
    }

    @Override
    public List<User> findunitbyuser(User user) {
        return userDao.findunitbyuser(user);
    }

}
