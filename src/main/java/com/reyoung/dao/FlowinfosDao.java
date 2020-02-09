package com.reyoung.dao;

import com.reyoung.model.Flowinfos;
import com.reyoung.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
@Repository("flowinfosDao")
public interface FlowinfosDao {

    public Integer addflowinfo(Flowinfos flowinfos);

    public List<Flowinfos> findallflowinfos();

    public Flowinfos findflwoinfobyfid(Flowinfos flowinfos);

    //审批flowinfos
    public Integer updateflowinfobyflowinfoid(Flowinfos flowinfos);

    //根据uid查询流程的信息
    public List<Flowinfos> findflowinfosbyuid(User user);

    //查询已处理的流程
    public List<Flowinfos> findealflowinfos();

    //经办人查询已处理的流程
    public List<Flowinfos> findapplyflowinfoedlist(User user);

    //根据fid删除flowinfos
    public Integer delflowinfosbyfid(Flowinfos flowinfos);

}
