package com.reyoung.service;

import com.reyoung.model.DevicePlan;
import com.reyoung.model.Flowinfos;

/**
 * Created by yangtao on 2020-02-11.
 */
public interface DevicePlanService {

    public Integer adddeviceplan(DevicePlan devicePlan);

    public DevicePlan finddeviceplanbyflowinfo(Flowinfos flowinfos);

}
