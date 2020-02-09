package com.reyoung.service;

import com.reyoung.model.Flowinfos;
import com.reyoung.model.RepairePlan;

/**
 * Created by yangtao on 2020-02-09.
 */
public interface RepairePlanService {

    public Integer addrepaireplan(RepairePlan repairePlan);

    //根据repaireid查询repaireplan
    public RepairePlan findrepairedetailbyrid(Flowinfos flowinfos);



}
