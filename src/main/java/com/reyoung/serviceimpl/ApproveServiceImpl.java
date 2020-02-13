package com.reyoung.serviceimpl;

import com.reyoung.dao.ApproveDao;
import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.ApproveService;
import com.reyoung.tools.GetYear;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
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
    public List<Approve> findapprovedlistbyflowinfoid(Flowinfos flowinfos) {

        List<Approve> approves = approveDao.findapprolistbyflowinfoid(flowinfos);

        List<Approve> approves1=new ArrayList<>();

        //判断有无经办者   position==1 提报人
        for (Approve a:approves) {

            if (a.getUser().getPosition().getPosid()==1) {//将提报人添加到审批记录中去

                a.setDealtime(a.getArrivetime());

                approves1.add(a);

                break;

            }

        }

        //循环完成后需要判断approve的大小 ==0是不存在经办人,需要将经办人手动添加到approve
        if (approves1.size()==0) {

            Approve approve=new Approve();

            approve.setUser(flowinfos.getUser());

            approve.setFlowinfos(flowinfos);

            approve.setArrivetime(GetYear.getstrtim(flowinfos.getStartime()));

            approve.setDealtime(GetYear.getstrtim(flowinfos.getStartime()));

            approve.setApproflag(0);

            approves1.add(approve);

        }
            for (Approve a:approves) {

                if (a.getUser().getPosition().getPosid()>1&&a.getApproflag()>0) {//筛选出审批通过的人员的记录

                    approves1.add(a);

                }

            }

        //对list集合进行倒排序
        Collections.reverse(approves1);

        return approves1;

    }

    @Override
    public Integer addapprovebyappro(Approve approve) {


        return approveDao.addapprovebyappro(approve);

    }

    @Override
    public Approve findapprovebyuidandfid(Approve approve) {



        return approveDao.findapprovebyuidandfid(approve);

    }

    @Override
    public Integer updateapprobyuidandfid(Approve approve) {



        return approveDao.updateapprobyuidandfid(approve);

    }

    @Override
    public Integer delapprovesbyaid(List<Approve> approves) {
        return approveDao.delapprovesbyaid(approves);
    }

    @Override
    public List<Approve> findapprobyok(Flowinfos flowinfos) {

        return approveDao.findapprobyok(flowinfos);

    }

}
