package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FinterfaceDao;
import com.reyoung.model.filter.Finterface;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FinterfaceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Service("finterfaceService")
@DataSource("dataSource")
public class FinterfaceServiceImpl implements FinterfaceService {

    @Resource(name = "finterfaceDao")
    private FinterfaceDao finterfaceDao;

    @Override
    public List<Finterface> findallfinterface() {
        return finterfaceDao.findallfinterface();
    }
}
