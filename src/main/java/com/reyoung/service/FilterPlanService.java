package com.reyoung.service;

import com.reyoung.model.FilterPlan;
import com.reyoung.model.Flowinfos;

/**
 * Created by yangtao on 2020-01-15.
 */
public interface FilterPlanService {

    public Integer addfilterplan(FilterPlan filterPlan);


    public FilterPlan findfilterplanbyincident(Flowinfos flowinfos);


    public Integer delfilterplanbypid(FilterPlan filterPlan);

}
