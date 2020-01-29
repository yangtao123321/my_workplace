package com.reyoung.dao;

import com.reyoung.model.Department;
import com.reyoung.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
@Repository("departmentDao")
public interface DepartmentDao {

    public List<Department> findalldepartment();

    public Department finddepartmentbydid(User user);

}
