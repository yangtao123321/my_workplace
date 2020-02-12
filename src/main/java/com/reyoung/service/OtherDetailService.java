package com.reyoung.service;

import com.reyoung.model.OtherDetail;
import com.reyoung.model.OtherPlan;

import java.util.List;

/**
 * Created by yangtao on 2020-02-12.
 */
public interface OtherDetailService {

    public Integer addotherdetailbyotherdetail(List<OtherDetail> otherDetails);

    public List<OtherDetail> findotherdetailbyotherplan(OtherPlan otherPlan);

}
