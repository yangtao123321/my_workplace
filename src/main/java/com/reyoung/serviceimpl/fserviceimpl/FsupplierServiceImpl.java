package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FsupplierDao;
import com.reyoung.model.filter.Fsupplier;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FsupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-14.
 */
@Service("fsupplierService")
@DataSource("dataSource")
public class FsupplierServiceImpl implements FsupplierService {

    @Resource(name = "fsupplierDao")
    private FsupplierDao fsupplierDao;

    @Override
    public List<Fsupplier> findallfsupplier() {
        return fsupplierDao.findallfsupplier();
    }

}
