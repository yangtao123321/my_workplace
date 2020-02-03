package com.reyoung.serviceimpl;

import com.reyoung.dao.FlowsDao;
import com.reyoung.model.Flows;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.FlowsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-03.
 */
@Service("flowsService")
@DataSource("dataSource")
public class FlowsServiceImpl implements FlowsService {

    @Resource(name = "flowsDao")
    private FlowsDao flowsDao;

    @Override
    public List<Flows> findallflows() {



        return flowsDao.findallflows();



    }
}
