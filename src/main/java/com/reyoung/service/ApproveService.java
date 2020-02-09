package com.reyoung.service;

import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;

import java.util.List;

/**
 * Created by yangtao on 2020-01-18.
 */
public interface ApproveService {

    public Integer findapprobyapp(Approve approve);

    public List<Approve> findapprolistbyflowinfoid(Flowinfos flowinfos);

    public List<Approve> findapprovedlistbyflowinfoid(Flowinfos flowinfos);

    public Integer addapprovebyappro(Approve approve);

    //根据uid、fid 查询approve
    public Approve findapprovebyuidandfid(Approve approve);

    //更新审批操作
    public Integer updateapprobyuidandfid(Approve approve);

    //批量删除approves
    public Integer delapprovesbyaid(List<Approve> approves);


}
