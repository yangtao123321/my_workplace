package com.reyoung.service;

import com.reyoung.model.Department;
import com.reyoung.model.User;

import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
public interface DepartmentService {

    public List<Department> findalldepartment();

    public Department finddepartmentbydid(User user);

}
