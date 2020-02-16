package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FherpinDao;
import com.reyoung.model.filter.Fherpin;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FherbinService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-14.
 */
@Service("fherbinService")
@DataSource("dataSource")
public class FherbinServiceImpl implements FherbinService {

    @Resource(name = "fherpinDao")
    private FherpinDao fherpinDao;


    @Override
    public List<Fherpin> findallfherpin() {
        return fherpinDao.findallfherpin();
    }

}
