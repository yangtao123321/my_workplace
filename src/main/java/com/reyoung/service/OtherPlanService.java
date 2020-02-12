package com.reyoung.service;

import com.reyoung.model.Flowinfos;
import com.reyoung.model.OtherPlan;

/**
 * Created by yangtao on 2020-02-12.
 */
public interface OtherPlanService {

    public Integer addotherplan(OtherPlan otherPlan);

    public OtherPlan findotherplanbyflowinfos(Flowinfos flowinfos);

}
