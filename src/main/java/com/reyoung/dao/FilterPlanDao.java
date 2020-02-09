package com.reyoung.dao;

import com.reyoung.model.FilterPlan;
import com.reyoung.model.Flowinfos;
import org.springframework.stereotype.Repository;

/**
 * Created by yangtao on 2020-01-15.
 */
@Repository("filterPlanDao")
public interface FilterPlanDao {

    public Integer addfilterplan(FilterPlan filterPlan);

    public FilterPlan findfilterplanbyincident(Flowinfos flowinfos);

    public Integer delfilterplanbypid(FilterPlan filterPlan);

}
