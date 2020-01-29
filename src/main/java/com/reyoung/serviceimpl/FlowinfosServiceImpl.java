package com.reyoung.serviceimpl;

import com.reyoung.dao.FlowinfosDao;
import com.reyoung.model.Approve;
import com.reyoung.model.Flowinfos;
import com.reyoung.model.User;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.pager.PageBean;
import com.reyoung.service.ApproveService;
import com.reyoung.service.FlowinfosService;
import com.reyoung.tools.GetYear;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
@Service("flowinfosService")
@DataSource("dataSource")
public class FlowinfosServiceImpl implements FlowinfosService {

    @Resource(name = "flowinfosDao")
    private FlowinfosDao flowinfosDao;


    @Resource(name = "approveService")
    private ApproveService approveService;

    @Override
    public Integer addflowinfo(Flowinfos flowinfos) {

        return flowinfosDao.addflowinfo(flowinfos);

    }

    @Override
    public Integer finddealscountbyuser(User user) {

        List<Flowinfos> flowinfoses = flowinfosDao.findallflowinfos();

        List<Flowinfos> flowinfoses1=new ArrayList<>();

        for (Flowinfos f:flowinfoses) {

            //筛选出部门来  同一个部门的流程信息进入
            if (user.getSection().getSectionid()==f.getUser().getSection().getSectionid()) {

                //筛选同一个单位的 车间主任只获取自己车间的  文件小组获取本部门下所有车间的滤芯计划

                if (f.getFlows().getFlowid()==1) {//滤芯计划

                    if (user.getPosition().getPosname().equals("单位负责人")&&user.getUsername().equals("zhangna")) {//粉针事业部张主任审批滤芯计划

                        if (f.getFlag()==user.getPosition().getApproflag()+1) {//到达张主任这里的情况

                            flowinfoses1.add(f);

                        }

                    }else if (user.getPosition().getPosname().equals("单位负责人")){//一般的单位负责人   只获取自己单位的计划

                        if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                            flowinfoses1.add(f);

                        }

                    }else if (user.getPosition().getPosname().equals("部门经理")) {

                        if (user.getSection().getSectionid()==f.getUser().getSection().getSectionid()) {

                            if (user.getPosition().getApproflag()+2==f.getFlag()) {

                                flowinfoses1.add(f);

                            }

                        }


                    }

                }else if (f.getFlows().getFlowid()==2) {//维护保养计划

                    if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                        flowinfoses1.add(f);

                    }

                }else {//其他采购计划

                    if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                        flowinfoses1.add(f);

                    }

                }

            }

        }

        return flowinfoses1.size();

    }

    @Override
    public PageBean<Flowinfos> finddealsbyuser(User user,PageBean<Flowinfos> pageBean) {

        Approve approve=new Approve();

        List<Flowinfos> flowinfoses = flowinfosDao.findallflowinfos();

        List<Flowinfos> flowinfoses1=new ArrayList<>();

            for (Flowinfos f:flowinfoses) {

                //筛选出部门来  同一个部门的流程信息进入
                if (user.getSection().getSectionid()==f.getUser().getSection().getSectionid()) {

                    //筛选同一个单位的 车间主任只获取自己车间的  文件小组获取本部门下所有车间的滤芯计划

                    if (f.getFlows().getFlowid()==1) {//滤芯计划

                        if (user.getPosition().getPosname().equals("单位负责人")&&user.getUsername().equals("zhangna")) {//粉针事业部张主任审批滤芯计划

                            if (f.getFlag()==user.getPosition().getApproflag()+1) {//到达张主任这里的情况

                                flowinfoses1.add(f);

                            }

                        }else if (user.getPosition().getPosname().equals("单位负责人")){//一般的单位负责人   只获取自己单位的计划

                           if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                               flowinfoses1.add(f);

                           }

                        }else if (user.getPosition().getPosname().equals("部门经理")) {//部门经理审核 需获取本部门下所有单位的计划

                            if (user.getSection().getSectionid()==f.getUser().getSection().getSectionid()) {

                                if (f.getFlag()==user.getPosition().getApproflag()+2) {//流程到达部门经理这里

                                    flowinfoses1.add(f);

                                }

                            }

                        }

                    }else if (f.getFlows().getFlowid()==2) {//维护保养计划

                        if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                            flowinfoses1.add(f);

                        }

                    }else {//其他采购计划

                        if ((user.getDepartment().getDeptid()==f.getUser().getDepartment().getDeptid())&&(user.getPosition().getApproflag()==f.getFlag())) {

                            flowinfoses1.add(f);

                        }
                    }

                }

            }


        for (Flowinfos f:flowinfoses1) {

            //添加流程的到达时间   查询有没有审批的记录
            approve.setUser(user);
            approve.setFlowinfos(f);
            approve.setApproflag(0);//设置未审批的状态

            Integer res = approveService.findapprobyapp(approve);

            //不存在自己的审批,需要新增一条审批记录，并将上次处理的时间保存进去  到达时间   结束时间审批的时候新增进去
            if (res==0) {

                //根据Flowinfoid查询有出所有其他的审批记录
                List<Approve> approves = approveService.findapprolistbyflowinfoid(f);

                if (approves.size()==0) {//没有一个人添加审批记录，直接添加即可

                    approve.setArrivetime(GetYear.getstrtim(f.getStartime()));

                    approveService.addapprovebyappro(approve);//添加审批记录

                }else {//存在多个审批记录的情况

                    if (f.getFlows().getFlowid()==1) {//滤芯计划

                        if (user.getPosition().getPosid()==2&&user.getUsername().equals("zhangna")) {

                            //System.out.println("zhangna"); 此时车间负责人已经审批完成，需要查询单位负责人的

                            for (Approve a:approves) {//筛选出和自己相同职位的审批记录并且已经审批完成的  一个流程同级审批只有一个审批记录

                                if (a.getUser().getPosition().getPosid()==user.getPosition().getPosid()&&a.getApproflag()==1) {

                                    approve.setArrivetime(a.getDealtime());

                                    approveService.addapprovebyappro(approve);

                                    break;//跳出本次循环体

                                }

                            }

                        }else if (user.getPosition().getPosid()==2) {

                            approve.setArrivetime(GetYear.getstrtim(f.getStartime()));

                            approveService.addapprovebyappro(approve);//添加审批记录

                        }else if (user.getPosition().getPosid()==3) {//部门经理审核 滤芯计划需要查询zhangna的审批记录获取到达的时间

                            for (Approve a:approves) {

                                if (a.getUser().getPosition().getPosid()==user.getPosition().getPosid()-1&&a.getUser().getUsername().equals("zhangna")&&a.getApproflag()==1) {

                                    approve.setArrivetime(a.getDealtime());

                                    approveService.addapprovebyappro(approve);

                                    break;//跳出本次循环体

                                }

                            }


                        }



                    }else {

                        if (user.getPosition().getPosid()==2) {//单位负责人审核

                            approve.setArrivetime(GetYear.getstrtim(f.getStartime()));

                            approveService.addapprovebyappro(approve);//添加审批记录

                        }else if (user.getPosition().getPosid()==3) {//部门负责人审核



                        }

                    }

                }


            }

            //根据uid和Flowinfoid查询审批记录

            Approve approve1 = approveService.findapprovebyuidandfid(approve);

            f.setApprove(approve1);

        }

        List<Flowinfos> flowinfoses2=null;

        if (pageBean.getCurrentPage()==pageBean.getTotalPage()) {
            flowinfoses2= flowinfoses1.subList((pageBean.getCurrentPage() - 1) * pageBean.getPageSize(), flowinfoses1.size());
        }else if (pageBean.getCurrentPage()<pageBean.getTotalPage()){
            flowinfoses2 = flowinfoses1.subList((pageBean.getCurrentPage() - 1) * pageBean.getPageSize(), pageBean.getCurrentPage()*pageBean.getPageSize());
        }else {
            flowinfoses2=null;
        }

        pageBean.setList(flowinfoses2);

        System.out.println(pageBean);

        return pageBean;

    }

    @Override
    public Flowinfos findflwoinfobyfid(Flowinfos flowinfos) {

        return flowinfosDao.findflwoinfobyfid(flowinfos);

    }

}
