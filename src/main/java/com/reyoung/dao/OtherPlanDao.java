package com.reyoung.dao;

import com.reyoung.model.Flowinfos;
import com.reyoung.model.OtherPlan;
import org.springframework.stereotype.Repository;

/**
 * Created by yangtao on 2020-02-12.
 */
@Repository("otherPlanDao")
public interface OtherPlanDao {

    public Integer addotherplan(OtherPlan otherPlan);

    public OtherPlan findotherplanbyflowinfos(Flowinfos flowinfos);

}
