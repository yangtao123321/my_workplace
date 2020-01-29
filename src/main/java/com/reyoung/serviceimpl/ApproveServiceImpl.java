package com.reyoung.serviceimpl;

import com.reyoung.dao.ApproveDao;
import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.ApproveService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-01-18.
 */
@Service("approveService")
@DataSource("dataSource")
public class ApproveServiceImpl implements ApproveService {

    @Resource(name = "approveDao")
    private ApproveDao approveDao;

    @Override
    public Integer findapprobyapp(Approve approve) {

        return approveDao.findapprobyapp(approve);

    }

    @Override
    public List<Approve> findapprolistbyflowinfoid(Flowinfos flowinfos) {

        return approveDao.findapprolistbyflowinfoid(flowinfos);
    }

    @Override
    public Integer addapprovebyappro(Approve approve) {


        return approveDao.addapprovebyappro(approve);

    }

    @Override
    public Approve findapprovebyuidandfid(Approve approve) {



        return approveDao.findapprovebyuidandfid(approve);

    }
}
