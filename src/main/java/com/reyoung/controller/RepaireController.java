package com.reyoung.controller;

import com.reyoung.model.*;
import com.reyoung.service.FlowinfosService;
import com.reyoung.service.RepairePlanService;
import com.reyoung.service.SectionService;
import com.reyoung.tools.GetYear;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by yangtao on 2020-02-08.
 */
@Controller
public class RepaireController {

    @Resource(name = "sectionService")
    private SectionService sectionService;

    @Resource(name = "repairePlanService")
    private RepairePlanService repairePlanService;

    @Resource(name = "flowinfosService")
    private FlowinfosService flowinfosService;

    @RequestMapping("/climptorepaire.do")
    public String climptorepaire(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        if (user==null) {

            return "login";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            return "WEB-INF/repaire/RepairePage";

        }

    }

    //提交维修计划
    @RequestMapping("/applyrepaireplan.do")
    public @ResponseBody String applyrepaireplan(HttpServletRequest request,RepairePlan repairePlan,Flowinfos flowinfos) {

        Integer res = repairePlanService.addrepaireplan(repairePlan);

        repairePlan.setApplytime1(GetYear.formtim(repairePlan.getApplytime()));

        if (res==1) {//维修计划添加成功

            flowinfos.setIncident(repairePlan.getRepaireid());

            flowinfos.setFlows(new Flows(repairePlan.getFlowid()));

            flowinfos.setPerson(repairePlan.getApplyperson());

            flowinfos.setFlowabstract(repairePlan.getApplyabstract());

            flowinfos.setStartime(repairePlan.getApplytime1());

            flowinfos.setStartime1(repairePlan.getApplytime());

            flowinfos.setFlag(0);

            flowinfos.setAchieve(0);

            //将流程信息添加到数据库
            Integer r = flowinfosService.addflowinfo(flowinfos);

        }

        return null;

    }

}
