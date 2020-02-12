package com.reyoung.serviceimpl;

import com.reyoung.dao.DevicePlanDao;
import com.reyoung.model.DevicePlan;
import com.reyoung.model.Flowinfos;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.DevicePlanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yangtao on 2020-02-11.
 */
@Service("devicePlanService")
@DataSource("dataSource")
public class DevicePlanServiceImpl implements DevicePlanService {

    @Resource(name = "devicePlanDao")
    private DevicePlanDao devicePlanDao;

    @Override
    public Integer adddeviceplan(DevicePlan devicePlan) {

        return devicePlanDao.adddeviceplan(devicePlan);

    }

    @Override
    public DevicePlan finddeviceplanbyflowinfo(Flowinfos flowinfos) {

        return devicePlanDao.finddeviceplanbyflowinfo(flowinfos);

    }
}
