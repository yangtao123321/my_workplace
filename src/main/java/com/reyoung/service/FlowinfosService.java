package com.reyoung.service;

import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import com.reyoung.model.User;
import com.reyoung.pager.PageBean;

import javax.servlet.http.HttpServletRequest;

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
    public Integer updateflowinfobyflowinfoid(Approve approve,HttpServletRequest request);

    //拒绝的操作
    public Integer approbackflowinfobyflowinfoid(Approve approve);

    //查询已处理流程的数量   根据审批记录查询
    public Integer findflowinfoedcount(User user);

    //查询已处理的流程的信息
    public PageBean<Flowinfos> findflowinfoedlist(PageBean<Flowinfos> pageBean,User user);

    //根据uid查询自己申请的流程数
    public Integer findflowinfoscountbyuid(User user);

    //根据uid查询自己申请的流程的信息
    public PageBean<Flowinfos> findflowinfosbyuid(User user,PageBean<Flowinfos> pageBean);

    //查询自己申请已处理的流程数
    public Integer findapplyflowinfoedbyuid(User user);

    public PageBean<Flowinfos> findapplyflowinfoedlistbyuid(PageBean<Flowinfos> pageBean,User user);

    //根据fid删除flowinfos
    public Integer delflowinfosbyfid(Flowinfos flowinfos);

    //查询所有流程的总数量
    public Integer findallflowinfocount();

    //查询所有流程的列表
    public PageBean<Flowinfos> findallflowinfolist(PageBean<Flowinfos> pageBean);

    public PageBean<Flowinfos> findflowinfosbyid(Flowinfos flowinfos,PageBean<Flowinfos> pageBean);

}
