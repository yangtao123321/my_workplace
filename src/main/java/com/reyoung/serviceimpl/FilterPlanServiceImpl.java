package com.reyoung.serviceimpl;

import com.reyoung.dao.FilterPlanDao;
import com.reyoung.model.FilterPlan;
import com.reyoung.model.Flowinfos;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.FilterPlanService;
import com.reyoung.tools.GetYear;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yangtao on 2020-01-15.
 */
@Service("filterPlanService")
@DataSource("dataSource")
public class FilterPlanServiceImpl implements FilterPlanService {

    @Resource(name = "filterPlanDao")
    private FilterPlanDao filterPlanDao;

    @Override
    public Integer addfilterplan(FilterPlan filterPlan) {

        String applytime = filterPlan.getApplytime();

        filterPlan.setApplytime1(GetYear.formtim(applytime));

        return filterPlanDao.addfilterplan(filterPlan);

    }

    @Override
    public FilterPlan findfilterplanbyincident(Flowinfos flowinfos) {

        FilterPlan filterPlan = filterPlanDao.findfilterplanbyincident(flowinfos);

        filterPlan.setApplytime(GetYear.getstrtim(filterPlan.getApplytime1()));

        return filterPlan;

    }

    @Override
    public Integer delfilterplanbypid(FilterPlan filterPlan) {
        return filterPlanDao.delfilterplanbypid(filterPlan);
    }

}
