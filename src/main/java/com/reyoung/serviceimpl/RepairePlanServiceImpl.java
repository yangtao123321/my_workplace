package com.reyoung.serviceimpl;

import com.reyoung.dao.RepairePlanDao;
import com.reyoung.model.Flowinfos;
import com.reyoung.model.RepairePlan;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.RepairePlanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yangtao on 2020-02-09.
 */
@Service("repairePlanService")
@DataSource("dataSource")
public class RepairePlanServiceImpl implements RepairePlanService {

    @Resource(name = "repairePlanDao")
    private RepairePlanDao repairePlanDao;

    @Override
    public Integer addrepaireplan(RepairePlan repairePlan) {

        return repairePlanDao.addrepaireplan(repairePlan);

    }

    @Override
    public RepairePlan findrepairedetailbyrid(Flowinfos flowinfos) {

        return repairePlanDao.findrepairedetailbyrid(flowinfos);

    }

}
