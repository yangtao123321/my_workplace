package com.reyoung.service;

import com.reyoung.model.FilterDetail;
import com.reyoung.model.FilterPlan;

import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
public interface FilterDetailService {

    public Integer addfilterdetailbylist(List<FilterDetail> filterDetails);


    //根据fid查询滤芯的详情
    public List<FilterDetail> findfilterdetailbyfid(FilterPlan filterPlan);

}
