package com.reyoung.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reyoung.model.*;
import com.reyoung.model.filter.*;
import com.reyoung.pager.PageBean;
import com.reyoung.service.*;
import com.reyoung.service.fservice.*;
import com.reyoung.tools.GetYear;
import com.reyoung.tools.TextMail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
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

    @Resource(name = "repairePlanService")
    private RepairePlanService repairePlanService;

    @Resource(name = "devicePlanService")
    private DevicePlanService devicePlanService;

    @Resource(name = "deviceDetailService")
    private DeviceDetailService deviceDetailService;

    @Resource(name = "otherPlanService")
    private OtherPlanService otherPlanService;

    @Resource(name = "otherDetailService")
    private OtherDetailService otherDetailService;

    @Resource(name = "filterDetailService")
    private FilterDetailService filterDetailService;

    @Resource(name = "flowinfosService")
    private FlowinfosService flowinfosService;

    @Resource(name = "approveService")
    private ApproveService approveService;

    @Resource(name = "userService")
    private UserService userService;

    //查询滤芯详细内容相关的service

    @Resource(name = "fnameService")
    private FnameService fnameService;

    @Resource(name = "fsizeService")
    private FsizeService fsizeService;

    @Resource(name = "fdgreeService")
    private FdgreeService fdgreeService;

    @Resource(name = "finterfaceService")
    private FinterfaceService finterfaceService;

    @Resource(name = "fherbinService")
    private FherbinService fherbinService;

    @Resource(name = "fsupplierService")
    private FsupplierService fsupplierService;

    @RequestMapping("/climpfilterpage.do")
    public String climpfilterpage(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        List<Fname> fnames = fnameService.findallfname();

        List<Fsize> fsizes = fsizeService.findallfsize();

        List<Fdgree> fdgrees = fdgreeService.findallfdgree();

        List<Finterface> finterfaces = finterfaceService.findallfinterface();

        List<Fherpin> fherpins = fherbinService.findallfherpin();

        List<Fsupplier> fsuppliers = fsupplierService.findallfsupplier();

        if (user==null) {

            return "login";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            request.setAttribute("fnames",fnames);

            request.setAttribute("fsizes",fsizes);

            request.setAttribute("fdgrees",fdgrees);

            request.setAttribute("finterfaces",finterfaces);

            request.setAttribute("fherpins",fherpins);

            request.setAttribute("fsuppliers",fsuppliers);

            return "WEB-INF/filter/FilterPage";

        }

    }

    //跳转到滤芯采购流程申请页面 小屏幕
    @RequestMapping("climpfilterpage1.do")
    public String climpfilterpage1(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        List<Fname> fnames = fnameService.findallfname();

        List<Fsize> fsizes = fsizeService.findallfsize();

        List<Fdgree> fdgrees = fdgreeService.findallfdgree();

        List<Finterface> finterfaces = finterfaceService.findallfinterface();

        List<Fherpin> fherpins = fherbinService.findallfherpin();

        List<Fsupplier> fsuppliers = fsupplierService.findallfsupplier();

        if (user==null) {

            return "login1";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            request.setAttribute("fnames",fnames);

            request.setAttribute("fsizes",fsizes);

            request.setAttribute("fdgrees",fdgrees);

            request.setAttribute("finterfaces",finterfaces);

            request.setAttribute("fherpins",fherpins);

            request.setAttribute("fsuppliers",fsuppliers);

            return "WEB-INF/smallscreen/filter/FilterPage";

        }

    }

    //跳转到滤芯采购流程申请页面 ie8
    @RequestMapping("/climpfilterpageie8.do")
    public String climpfilterpageie8(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        List<Fname> fnames = fnameService.findallfname();

        List<Fsize> fsizes = fsizeService.findallfsize();

        List<Fdgree> fdgrees = fdgreeService.findallfdgree();

        List<Finterface> finterfaces = finterfaceService.findallfinterface();

        List<Fherpin> fherpins = fherbinService.findallfherpin();

        List<Fsupplier> fsuppliers = fsupplierService.findallfsupplier();

        if (user==null) {

            return "login1";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            request.setAttribute("fnames",fnames);

            request.setAttribute("fsizes",fsizes);

            request.setAttribute("fdgrees",fdgrees);

            request.setAttribute("finterfaces",finterfaces);

            request.setAttribute("fherpins",fherpins);

            request.setAttribute("fsuppliers",fsuppliers);

            return "WEB-INF/IE8/filter/FilterPage";

        }

    }

    //提交滤芯计划
    @RequestMapping("/receivefilter.do")
    public @ResponseBody String receivefilter(HttpServletRequest request,FilterPlan filterPlan,String users,Flowinfos flowinfos) {

        List<FilterDetail> filterDetails=new ArrayList<>();//创建一个集合将滤芯详情信息保存到list集合当中去

        JSONArray paradms = JSON.parseArray(users);

        for (int i=0;i<paradms.size();i++) {

            FilterDetail f=new FilterDetail();

            JSONObject paramjson = (JSONObject) paradms.get(i);

            String fdetailname = paramjson.getString("fdetailname");

            String fdetailsize = paramjson.getString("fdetailsize");

            String fdgree = paramjson.getString("fdgree");

            String fdetailinterface = paramjson.getString("fdetailinterface");

            String fherpin = paramjson.getString("fherpin");

            String fdetailnum = paramjson.getString("fdetailnum");

            String useing = paramjson.getString("useing");

            f.setFdetailname(fdetailname);
            f.setFdetailsize(fdetailsize);
            f.setFdgree(fdgree);
            f.setFdetailinterface(fdetailinterface);
            f.setFherpin(fherpin);
            f.setFdetailnum(fdetailnum);
            f.setUseing(useing);

            filterDetails.add(f);

        }

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

        /*


        //将filterplan保存到数据库，并要求发挥id号 用于保存滤芯明细时的外键约束
        Integer res = filterPlanService.addfilterplan(filterPlan);




        */

    }

    //滤芯审批页面
    @RequestMapping("/findflowinfinfodetailbyfid.do")
    public String findflowinfinfodetailbyfid(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        User user= (User)request.getSession().getAttribute("userinfo");

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(filterPlan.getReceive());

            request.setAttribute("filterpla", filterPlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/filter/FilterApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面

            RepairePlan repairePlan = repairePlanService.findrepairedetailbyrid(flowinfos1);

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(repairePlan.getReceive());

            request.setAttribute("repaire", repairePlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/repaire/RepaireApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("设备类采购流程")) {

            DevicePlan devicePlan = devicePlanService.finddeviceplanbyflowinfo(flowinfos1);

            devicePlan.setDeviceDetails(deviceDetailService.finddevicedetaillistbydeviceplan(devicePlan));

            Section section = sectionService.findsectionbyid(devicePlan.getReceive());

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            request.setAttribute("deviceplan",devicePlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/device/DeviceApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("一致性药品采购流程")) {//其它采购流程审批页面

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            OtherPlan otherPlan = otherPlanService.findotherplanbyflowinfos(flowinfos1);

            otherPlan.setOtherDetails(otherDetailService.findotherdetailbyotherplan(otherPlan));

            Section section = sectionService.findsectionbyid(otherPlan.getReceive());

            request.setAttribute("otherplan",otherPlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/other/OtherApprove";

        }

        return null;

    }

    //滤芯审批页 ie8
    @RequestMapping("/findflowinfinfodetailbyfidie8.do")
    public String findflowinfinfodetailbyfidie8(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        User user= (User)request.getSession().getAttribute("userinfo");

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(filterPlan.getReceive());

            request.setAttribute("filterpla", filterPlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/IE8/filter/FilterApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面

            RepairePlan repairePlan = repairePlanService.findrepairedetailbyrid(flowinfos1);

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(repairePlan.getReceive());

            request.setAttribute("repaire", repairePlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/IE8/repaire/RepaireApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("设备类采购流程")) {

            DevicePlan devicePlan = devicePlanService.finddeviceplanbyflowinfo(flowinfos1);

            devicePlan.setDeviceDetails(deviceDetailService.finddevicedetaillistbydeviceplan(devicePlan));

            Section section = sectionService.findsectionbyid(devicePlan.getReceive());

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            request.setAttribute("deviceplan",devicePlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/IE8/device/DeviceApprove";

        }else if (flowinfos1.getFlows().getFlowname().equals("一致性药品采购流程")) {//其它采购流程审批页面

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            OtherPlan otherPlan = otherPlanService.findotherplanbyflowinfos(flowinfos1);

            otherPlan.setOtherDetails(otherDetailService.findotherdetailbyotherplan(otherPlan));

            Section section = sectionService.findsectionbyid(otherPlan.getReceive());

            request.setAttribute("otherplan",otherPlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/IE8/other/OtherApprove";

        }

        return null;


    }

    //查看滤芯详情的页面
    @RequestMapping("/finddetailfilterbyapply.do")
    public String finddetailfilterbyapply(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        User user= (User)request.getSession().getAttribute("userinfo");

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(filterPlan.getReceive());

            request.setAttribute("filterpla", filterPlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/filter/FilterDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            RepairePlan repairePlan=repairePlanService.findrepairedetailbyrid(flowinfos1);

            Section section = sectionService.findsectionbyid(repairePlan.getReceive());

            request.setAttribute("repaire",repairePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/IE8/repaire/RepaireDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("设备类采购流程")) {

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            DevicePlan devicePlan = devicePlanService.finddeviceplanbyflowinfo(flowinfos1);

            devicePlan.setDeviceDetails(deviceDetailService.finddevicedetaillistbydeviceplan(devicePlan));

            Section section = sectionService.findsectionbyid(devicePlan.getReceive());

            request.setAttribute("deviceplan",devicePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/device/DeviceDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("一致性药品采购流程")) {//其它采购流程审批页面

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            OtherPlan otherPlan = otherPlanService.findotherplanbyflowinfos(flowinfos1);

            otherPlan.setOtherDetails(otherDetailService.findotherdetailbyotherplan(otherPlan));

            Section section = sectionService.findsectionbyid(otherPlan.getReceive());


            request.setAttribute("otherplan",otherPlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/other/OtherDetail";

        }

        return null;

    }

    //查看滤芯详情页 小屏幕
    @RequestMapping("/finddetailfilterbyapply1.do")
    public String finddetailfilterbyapply1(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        User user= (User)request.getSession().getAttribute("userinfo");

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(filterPlan.getReceive());

            request.setAttribute("filterpla", filterPlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/smallscreen/filter/FilterDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            RepairePlan repairePlan=repairePlanService.findrepairedetailbyrid(flowinfos1);

            Section section = sectionService.findsectionbyid(repairePlan.getReceive());

            request.setAttribute("repaire",repairePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/repaire/RepaireDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("设备类采购流程")) {

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            DevicePlan devicePlan = devicePlanService.finddeviceplanbyflowinfo(flowinfos1);

            devicePlan.setDeviceDetails(deviceDetailService.finddevicedetaillistbydeviceplan(devicePlan));

            Section section = sectionService.findsectionbyid(devicePlan.getReceive());

            request.setAttribute("deviceplan",devicePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/device/DeviceDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("一致性药品采购流程")) {//其它采购流程审批页面

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            OtherPlan otherPlan = otherPlanService.findotherplanbyflowinfos(flowinfos1);

            otherPlan.setOtherDetails(otherDetailService.findotherdetailbyotherplan(otherPlan));

            Section section = sectionService.findsectionbyid(otherPlan.getReceive());


            request.setAttribute("otherplan",otherPlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/other/OtherDetail";

        }

        return null;

    }

    //查看滤芯详情页 ie8
    @RequestMapping("/finddetailfilterbyapplyie8.do")
    public String finddetailfilterbyapplyie8(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        User user= (User)request.getSession().getAttribute("userinfo");

        if (flowinfos1.getFlows().getFlowname().equals("滤芯采购流程")) {//滤芯采购流程审批页面

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            //查询滤芯计划详情表 并将结果添加到filterplan中
            filterPlan.setFilterDetails(filterDetailService.findfilterdetailbyfid(filterPlan));

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            Section section = sectionService.findsectionbyid(filterPlan.getReceive());

            request.setAttribute("filterpla", filterPlan);

            request.setAttribute("appro",approves);

            request.setAttribute("sec",section);

            return "WEB-INF/IE8/filter/FilterDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("维修保养流程")) {//维修保养流程审核页面

            //根据Flowinfoid查询审批记录
            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            RepairePlan repairePlan=repairePlanService.findrepairedetailbyrid(flowinfos1);

            Section section = sectionService.findsectionbyid(repairePlan.getReceive());

            request.setAttribute("repaire",repairePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/IE8/repaire/RepaireDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("设备类采购流程")) {

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            DevicePlan devicePlan = devicePlanService.finddeviceplanbyflowinfo(flowinfos1);

            devicePlan.setDeviceDetails(deviceDetailService.finddevicedetaillistbydeviceplan(devicePlan));

            Section section = sectionService.findsectionbyid(devicePlan.getReceive());

            request.setAttribute("deviceplan",devicePlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/IE8/device/DeviceDetail";

        }else if (flowinfos1.getFlows().getFlowname().equals("一致性药品采购流程")) {//其它采购流程审批页面

            List<Approve> approves = approveService.findapprovedlistbyflowinfoid(flowinfos1);

            OtherPlan otherPlan = otherPlanService.findotherplanbyflowinfos(flowinfos1);

            otherPlan.setOtherDetails(otherDetailService.findotherdetailbyotherplan(otherPlan));

            Section section = sectionService.findsectionbyid(otherPlan.getReceive());

            request.setAttribute("otherplan",otherPlan);

            request.setAttribute("sec",section);

            request.setAttribute("appro",approves);

            return "WEB-INF/IE8/other/OtherDetail";

        }

        return null;

    }

    //审批同意了
    @RequestMapping("/agreeflowinfobyuser.do")
    public @ResponseBody String agreeflowinfobyuser(HttpServletRequest request,Flowinfos flowinfos,Approve approve) {

        User user= (User) request.getSession().getAttribute("userinfo");

        approve.setUser(user);

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(approve.getFlowinfos());

        approve.setFlowinfos(flowinfos1);

        return flowinfosService.updateflowinfobyflowinfoid(approve,request)+"";

    }

    //审批拒绝了
    @RequestMapping("/approbackflowinfobyuser.do")
    public @ResponseBody String approbackflowinfobyuser(HttpServletRequest request,Approve approve) throws Exception {

        User user= (User) request.getSession().getAttribute("userinfo");

        approve.setUser(user);

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(approve.getFlowinfos());

        approve.setFlowinfos(flowinfos1);

        Integer res = flowinfosService.approbackflowinfobyflowinfoid(approve);

        if (res==1) {

            List<String> list=new ArrayList<>();

            list.add(flowinfos1.getUser().getEmail());

            String subject="计划拒绝提醒";

            String context= "<font face='Terminal' style='font-size:19px'><span style='color: black;'>"+flowinfos1.getUser().getTruename()+",您好。</span><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贵单位提报的计划 &nbsp;&nbsp;&nbsp;实例号:"+flowinfos1.getFlowinfoid()+"&nbsp;&nbsp;&nbsp;名称:<span style='color:#00a400;'>"+flowinfos1.getFlowabstract()+"</span>&nbsp;&nbsp;&nbsp;已被<span style='color: red;'>"+user.getTruename()+"</span>拒绝，原因:"+approve.getSuggest()+"<br><br>&nbsp;&nbsp;&nbsp;请关注!</font>";

            TextMail.sendMail("yangtao@reyoung.com","YANGyang136164","192.168.8.3",list,"yangtao@reyoung.com",subject,context);

        }

        return res+"";

    }

    //查看流程图
    @RequestMapping("/climpflowpicbyfid.do")
    public String climpflowpicbyfid(HttpServletRequest request,Flowinfos flowinfos) {

        List<FlowPic> flowPics=new ArrayList<>();

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        //根据部门信息查询出部门经理的信息，如果是滤芯需要添加张娜，查询出单位负责人，提报人信息

        if (flowinfos1.getUser().getSection().getSectionid()==1) {//粉针事业部

            List<Approve> approves = approveService.findapprolistbyflowinfoid(flowinfos1);

            //部门经理
            User user = userService.findepartmanager();

            boolean f=false;

            FlowPic flowPic=new FlowPic();

            for (Approve a:approves) {

                if (a.getUser().getUid()==user.getUid()) {

                    flowPic.setName(user.getTruename());

                    flowPic.setAppfag(a.getApproflag());

                    flowPics.add(flowPic);

                    f=true;

                    break;

                }else {

                    f=false;

                }

            }

            if (!f) {

                flowPic.setName(user.getTruename());

                flowPic.setAppfag(0);

                flowPics.add(flowPic);

            }

            if (flowinfos1.getFlows().getFlowid()==1) {//滤芯计划

                User user1 = userService.findwenjianfuzeren();

                FlowPic flowPic1=new FlowPic();

                for (Approve a:approves) {

                    if (a.getUser().getUid()==user1.getUid()) {

                        flowPic1.setName(user1.getTruename());

                        flowPic1.setAppfag(a.getApproflag());

                        flowPics.add(flowPic1);

                        f=true;

                        break;

                    }else {

                        f=false;

                    }

                }

                if (!f) {

                    flowPic1.setName(user1.getTruename());

                    flowPic1.setAppfag(0);

                    flowPics.add(flowPic1);

                }

            }

            //查询单位负责人
            List<User> list = userService.findunitbyuser(flowinfos1.getUser());

            boolean s=false;

            FlowPic flowPic2=new FlowPic();

            for (User u:list) {

                boolean b=false;

                for (Approve a:approves) {

                    if (a.getUser().getUid()==u.getUid()&&a.getApproflag()>0) {

                        flowPic2.setName(u.getTruename());

                        flowPic2.setAppfag(a.getApproflag());

                        flowPics.add(flowPic2);

                        b=true;

                        break;

                    }

                }

                if (b) {

                    s=true;

                    break;

                }

            }

            if (!s) {

                flowPic2.setName(list.get(0).getTruename());

                flowPic2.setAppfag(0);

                flowPics.add(flowPic2);

            }

            FlowPic flowPic3=new FlowPic();

            flowPic3.setName(flowinfos1.getUser().getTruename());

            flowPic3.setAppfag(1);

            flowPics.add(flowPic3);

            Collections.reverse(flowPics);

            List<FlowPic> flowPics1=new ArrayList<>();

            for (FlowPic f1:flowPics) {

                if (f1.getAppfag()==2) {//拒绝后,就结束了

                    flowPics1.add(f1);

                }

            }

        }

        request.setAttribute("flowp",flowPics);

        return "WEB-INF/Flowpic";

    }

    //删除流程的信息
    @RequestMapping("/delflowinfosbyfid.do")
    public @ResponseBody String delflowinfosbyfid(HttpServletRequest request,Flowinfos flowinfos) {

        Flowinfos flowinfos1 = flowinfosService.findflwoinfobyfid(flowinfos);

        if (flowinfos1.getFlows().getFlowid()==1) {//判断滤芯计划

            FilterPlan filterPlan = filterPlanService.findfilterplanbyincident(flowinfos1);

            List<FilterDetail> details = filterDetailService.findfilterdetailbyfid(filterPlan);

            Integer res = filterDetailService.delfilterdetailbylist(details);

            Integer res1=0;

            Integer res3=0;

            if (res==details.size()&&res>0) {//滤芯详情已删除,可以删除filterplan

                 res1 = filterPlanService.delfilterplanbypid(filterPlan);

            }

            List<Approve> approves = approveService.findapprolistbyflowinfoid(flowinfos1);

            Integer res2 = approveService.delapprovesbyaid(approves);


            if (res2==approves.size()&&res2>0) {//删除flowinfos

                 res3 = flowinfosService.delflowinfosbyfid(flowinfos1);

            }


            if (res1==res3&&res1>0) {

                return "ok";

            }else {

                return "fails";

            }


        }else if (flowinfos1.getFlows().getFlowid()==2){//维修保养计划

            RepairePlan repairePlan = repairePlanService.findrepairedetailbyrid(flowinfos1);



        }else if (flowinfos1.getFlows().getFlowid()==3) {//其他采购项目



        }



        return null;

    }

    //查看流程图,生成流程信息前
    @RequestMapping("/climpflowpicpre.do")
    public String climpflowpicpre(HttpServletRequest request,Integer uid,Integer flowid) {

        if (uid==null&&flowid==null) {

            request.setAttribute("flowp","fails");

        }else {

            List<FlowPic> flowPics=new ArrayList<>();//用于存放审批人的姓名

            //查询部门经理
            User user = userService.findepartmanager();

            FlowPic flowPic=new FlowPic();

            if (user!=null) {

                flowPic.setName(user.getTruename());

                flowPics.add(flowPic);

            }

            if (flowid==1) {//滤芯计划

                //查询文件小组负责人
                User user1 = userService.findwenjianfuzeren();

                FlowPic flowPic1=new FlowPic();

                if (user1!=null) {

                    flowPic1.setName(user1.getTruename());

                    flowPics.add(flowPic1);

                }

            }

            //查询单位负责人

            User user1 = userService.finduserbyuid(uid);
            List<User> users = userService.findunitbyuser(user1);
            if (users!=null&&users.size()>0) {

                FlowPic flowPic3=new FlowPic();

                flowPic3.setName(users.get(0).getTruename());

                flowPics.add(flowPic3);

            }

            FlowPic flowPic5=new FlowPic();
            flowPic5.setName(user1.getTruename());

            flowPics.add(flowPic5);

            //对集合惊醒翻转的操作
            Collections.reverse(flowPics);

            request.setAttribute("flowp",flowPics);



        }

        return "WEB-INF/Flowpic1";

    }

    //根据实例号查询流程的信息
    @RequestMapping("/findflowinfobyfid.do")
    public @ResponseBody String findflowinfobyfid(HttpServletRequest request,Flowinfos flowinfos,PageBean<Flowinfos> pageBean) {

        if (pageBean.getCurrentPage()==null||pageBean.getCurrentPage()==0) {

            pageBean.setCurrentPage(1);

        }

        if (flowinfos.getFlowinfoid()==null||flowinfos.getFlowinfoid().equals("")) {//查询所有的流程信息

            pageBean.setPageSize(15);

            pageBean.setTotalRecord(flowinfosService.findallflowinfocount());

            pageBean.getTotalPage();

            PageBean<Flowinfos> page = flowinfosService.findallflowinfolist(pageBean);

            String json = JSONObject.toJSONString(page, SerializerFeature.WriteMapNullValue);

            return json;


        }else {//查询单条流程的信息

            pageBean.setPageSize(15);

            Integer totalRecord= flowinfosService.findflwoinfobyfid(flowinfos)==null?0:1;

            pageBean.setTotalRecord(totalRecord);

            pageBean.getTotalPage();

            PageBean<Flowinfos> page = flowinfosService.findflowinfosbyid(flowinfos, pageBean);

            System.out.println(page);

            String json = JSONObject.toJSONString(page, SerializerFeature.WriteMapNullValue);

            return json;


        }

    }

}
