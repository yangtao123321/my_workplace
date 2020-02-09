package com.reyoung.dao;

import com.reyoung.model.Flowinfos;
import com.reyoung.model.RepairePlan;
import org.springframework.stereotype.Repository;

/**
 * Created by yangtao on 2020-02-09.
 */
@Repository("repairePlanDao")
public interface RepairePlanDao {

    public Integer addrepaireplan(RepairePlan repairePlan);

    //根据repaireid查询repaireplan
    public RepairePlan findrepairedetailbyrid(Flowinfos flowinfos);

}
