package com.reyoung.serviceimpl;

import com.reyoung.dao.OtherPlanDao;
import com.reyoung.model.Flowinfos;
import com.reyoung.model.OtherPlan;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.OtherPlanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yangtao on 2020-02-12.
 */
@Service("otherPlanService")
@DataSource("dataSource")
public class OtherServiceImpl implements OtherPlanService {

    @Resource(name = "otherPlanDao")
    private OtherPlanDao otherPlanDao;

    @Override
    public Integer addotherplan(OtherPlan otherPlan) {

        return otherPlanDao.addotherplan(otherPlan);

    }

    @Override
    public OtherPlan findotherplanbyflowinfos(Flowinfos flowinfos) {
        return otherPlanDao.findotherplanbyflowinfos(flowinfos);
    }
}
