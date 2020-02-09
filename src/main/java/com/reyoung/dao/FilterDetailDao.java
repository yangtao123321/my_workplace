package com.reyoung.dao;

import com.reyoung.model.FilterDetail;
import com.reyoung.model.FilterPlan;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
@Repository("filterDetailDao")
public interface FilterDetailDao {

    //批量插入滤芯详情项   返回的是添加成功的条数
    public Integer addfilterdetailbylist(@Param("filterDetails") List<FilterDetail> filterDetails);

    //根据fid查询滤芯的详情
    public List<FilterDetail> findfilterdetailbyfid(FilterPlan filterPlan);

    //循环删除滤芯详情项   返回的是删除成功的条数
    public Integer delfilterdetailbylist(@Param("filterDetails") List<FilterDetail> filterDetails);

}
