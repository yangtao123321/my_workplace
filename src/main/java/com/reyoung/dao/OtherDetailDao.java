package com.reyoung.dao;

import com.reyoung.model.OtherDetail;
import com.reyoung.model.OtherPlan;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-12.
 */
@Repository("otherDetailDao")
public interface OtherDetailDao {

    public Integer addotherdetailbyotherdetail(@Param("otherDetails") List<OtherDetail> otherDetails);

    public List<OtherDetail> findotherdetailbyotherplan(OtherPlan otherPlan);

}
