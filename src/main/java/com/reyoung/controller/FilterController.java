package com.reyoung.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.reyoung.model.*;
import com.reyoung.service.FilterDetailService;
import com.reyoung.service.FilterPlanService;
import com.reyoung.service.FlowinfosService;
import com.reyoung.service.SectionService;
import com.reyoung.tools.GetYear;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangtao on 2020-01-09.
 */
//采购过滤器处理类
@Controller
public class FilterController {

    @Resource(name = "sectionService")
    private SectionService sectionService;

    @Resource(name = "filterPlanService")
    private FilterPlanService filterPlanService;

    @Resource(name = "filterDetailService")
    private FilterDetailService filterDetailService;

    @Resource(name = "flowinfosService")
    private FlowinfosService flowinfosService;

    @RequestMapping("/climpfilterpage.do")
    public String climpfilterpage(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        if (user==null) {

            return "login";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            return "WEB-INF/filter/FilterPage";

        }

    }

    @RequestMapping("/receivefilter.do")
    public @ResponseBody String receivefilter(HttpServletRequest request,FilterPlan filterPlan,String users,Flowinfos flowinfos) {

        List<FilterDetail> filterDetails=new ArrayList<>();//创建一个集合将滤芯详情信息保存到list集合当中去

        JSONArray paradms = JSON.parseArray(users);

        for (int i=0;i<paradms.size();i++) {

            FilterDetail f=new FilterDetail();

            JSONObject paramjson = (JSONObject) paradms.get(i);

            String fdetailname = paramjson.getString("fdetailname");

            String fdetailtype = paramjson.getString("fdetailtype");

            String fdetailsize = paramjson.getString("fdetailsize");

            String fdetailinterface = paramjson.getString("fdetailinterface");

            String fdetailnum = paramjson.getString("fdetailnum");

            String rek = paramjson.getString("rek");

            String useing = paramjson.getString("useing");

            f.setFdetailname(fdetailname);
            f.setFdetailtype(fdetailtype);
            f.setFdetailsize(fdetailsize);
            f.setFdetailinterface(fdetailinterface);
            f.setFdetailnum(fdetailnum);
            f.setRek(rek);
            f.setUseing(useing);

            filterDetails.add(f);

        }

        //将filterplan保存到数据库，并要求发挥id号 用于保存滤芯明细时的外键约束
        Integer res = filterPlanService.addfilterplan(filterPlan);

        if (res==1) {//添加成功的标志

            Integer flag=filterPlan.getFilterid();

            //保存plandetail时将该数值作为外键去使用

            for (FilterDetail filterDetail:filterDetails) {

                filterDetail.setFid(flag);

            }

            //需要将filterdetails保存到数据库中   批量的插入操作
            Integer t = filterDetailService.addfilterdetailbylist(filterDetails);

            //判断插入是否成功

          if (filterDetails.size()==t) {//全部插入成功后的逻辑   需要将流程信息的详情添加到流程信息表

              System.out.println(filterPlan);

              flowinfos.setFlows(new Flows(filterPlan.getFlowid()));//设置所属的流程

              flowinfos.setPerson(filterPlan.getApplyperson());//设置提报人

              flowinfos.setFlowabstract(filterPlan.getApplyabstract());//设置流程内容摘要

              flowinfos.setStartime(filterPlan.getApplytime1());

              flowinfos.setUser(filterPlan.getUser());

              flowinfos.setIncident(filterPlan.getFilterid());

              flowinfos.setFlag(0);//0表示没有任何人审批过

              //将流程信息添加到数据库
              Integer r = flowinfosService.addflowinfo(flowinfos);

              if (r==1) {//提交成功

                  return "success";

              }else {//提交失败

                  return "fails";

              }



          }else {

              return "fails";

          }


        }else {

            return "fails";

        }

    }

    @RequestMapping("/findflowinfinfodetailbyfid.do")
    public String findflowinfinfodetailbyfid(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            request.setAttribute("filterpla",filterPlan);

            return "WEB-INF/filter/FilterApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面



        }else if (flowinfos1.getFlows().getFlowname().equals("其他采购流程")) {//其它采购流程审批页面



        }

        return null;

    }



}
