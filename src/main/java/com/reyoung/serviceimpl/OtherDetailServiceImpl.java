package com.reyoung.serviceimpl;

import com.reyoung.dao.OtherDetailDao;
import com.reyoung.model.OtherDetail;
import com.reyoung.model.OtherPlan;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.OtherDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-12.
 */
@Service("otherDetailService")
@DataSource("dataSource")
public class OtherDetailServiceImpl implements OtherDetailService {

    @Resource(name = "otherDetailDao")
    private OtherDetailDao otherDetailDao;

    @Override
    public Integer addotherdetailbyotherdetail(List<OtherDetail> otherDetails) {
        return otherDetailDao.addotherdetailbyotherdetail(otherDetails);
    }

    @Override
    public List<OtherDetail> findotherdetailbyotherplan(OtherPlan otherPlan) {
        return otherDetailDao.findotherdetailbyotherplan(otherPlan);
    }
}
