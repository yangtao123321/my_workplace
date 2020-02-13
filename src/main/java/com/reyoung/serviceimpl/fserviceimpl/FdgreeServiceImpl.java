package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FdgreeDao;
import com.reyoung.model.filter.Fdgree;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FdgreeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Service("fdgreeService")
@DataSource("dataSource")
public class FdgreeServiceImpl implements FdgreeService {

    @Resource(name = "fdgreeDao")
    private FdgreeDao fdgreeDao;

    @Override
    public List<Fdgree> findallfdgree() {
        return fdgreeDao.findallfdgree();
    }
}
