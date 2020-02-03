package com.reyoung.service;

import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import com.reyoung.model.User;
import com.reyoung.pager.PageBean;

/**
 * Created by yangtao on 2020-01-16.
 */
public interface FlowinfosService {

    public Integer addflowinfo(Flowinfos flowinfos);

    //查询待办任务的总条数
    public Integer finddealscountbyuser(User user);

    //根据user查询需要自己待办的任务
    public PageBean<Flowinfos> finddealsbyuser(User user,PageBean<Flowinfos> pageBean);

    public Flowinfos findflwoinfobyfid(Flowinfos flowinfos);

    //审批flowinfos
    public Integer updateflowinfobyflowinfoid(Approve approve);

    //拒绝的操作
    public Integer approbackflowinfobyflowinfoid(Approve approve);

    //根据uid查询自己申请的流程数
    public Integer findflowinfoscountbyuid(User user);

    //根据uid查询自己申请的流程的信息
    public PageBean<Flowinfos> findflowinfosbyuid(User user,PageBean<Flowinfos> pageBean);

}
