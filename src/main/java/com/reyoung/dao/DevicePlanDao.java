package com.reyoung.dao;

import com.reyoung.model.DevicePlan;
import com.reyoung.model.Flowinfos;
import org.springframework.stereotype.Repository;

/**
 * Created by yangtao on 2020-02-11.
 */
@Repository("devicePlanDao")
public interface DevicePlanDao {

    public Integer adddeviceplan(DevicePlan devicePlan);

    //根据flowinfos id查询deviceplan
    public DevicePlan finddeviceplanbyflowinfo(Flowinfos flowinfos);

}
