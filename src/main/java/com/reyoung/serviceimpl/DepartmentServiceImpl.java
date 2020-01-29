package com.reyoung.serviceimpl;

import com.reyoung.dao.DepartmentDao;
import com.reyoung.model.Department;
import com.reyoung.model.User;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
@Service("departmentService")
@DataSource("dataSource")
public class DepartmentServiceImpl implements DepartmentService {

    @Resource(name = "departmentDao")
    private DepartmentDao departmentDao;

    @Override
    public List<Department> findalldepartment() {
        return departmentDao.findalldepartment();
    }

    @Override
    public Department finddepartmentbydid(User user) {
        return departmentDao.finddepartmentbydid(user);
    }

}
