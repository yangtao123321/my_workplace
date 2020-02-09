package com.reyoung.serviceimpl;

import com.reyoung.dao.FilterDetailDao;
import com.reyoung.model.FilterDetail;
import com.reyoung.model.FilterPlan;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.FilterDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
@Service("filterDetailService")
@DataSource("dataSource")
public class FilterDetailServiceImpl implements FilterDetailService {

    @Resource(name = "filterDetailDao")
    private FilterDetailDao filterDetailDao;

    @Override
    public Integer addfilterdetailbylist(List<FilterDetail> filterDetails) {

        return filterDetailDao.addfilterdetailbylist(filterDetails);

    }

    @Override
    public List<FilterDetail> findfilterdetailbyfid(FilterPlan filterPlan) {
        return filterDetailDao.findfilterdetailbyfid(filterPlan);
    }

    @Override
    public Integer delfilterdetailbylist(List<FilterDetail> filterDetails) {
        return filterDetailDao.delfilterdetailbylist(filterDetails);
    }

}
