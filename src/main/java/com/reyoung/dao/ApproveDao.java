package com.reyoung.dao;

import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-01-18.
 */
@Repository("approveDao")
public interface ApproveDao {

    public Integer findapprobyapp(Approve approve);

    public List<Approve> findapprolistbyappro(Approve approve);

    public List<Approve> findapprolistbyflowinfoid(Flowinfos flowinfos);

    public Integer addapprovebyappro(Approve approve);

    //根据uid、fid 查询approve
    public Approve findapprovebyuidandfid(Approve approve);

    //更新审批操作
    public Integer updateapprobyuidandfid(Approve approve);

    //批量删除approves
    public Integer delapprovesbyaid(@Param("approves") List<Approve> approves);

    public List<Approve> findapprobyok(Flowinfos flowinfos);

}
