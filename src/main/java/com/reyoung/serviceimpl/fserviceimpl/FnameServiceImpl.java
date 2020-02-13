package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FnameDao;
import com.reyoung.model.filter.Fname;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FnameService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Service("fnameService")
@DataSource("dataSource")
public class FnameServiceImpl implements FnameService {

    @Resource(name = "fnameDao")
    private FnameDao fnameDao;

    @Override
    public List<Fname> findallfname() {
        return fnameDao.findallfname();
    }
}
