package com.reyoung.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.reyoung.model.*;
import com.reyoung.service.DeviceDetailService;
import com.reyoung.service.DevicePlanService;
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
 * Created by yangtao on 2020-02-11.
 */
@Controller
public class DeviceController {

    @Resource(name = "sectionService")
    private SectionService sectionService;

    @Resource(name = "devicePlanService")
    private DevicePlanService devicePlanService;

    @Resource(name = "deviceDetailService")
    private DeviceDetailService deviceDetailService;

    @Resource(name = "flowinfosService")
    private FlowinfosService flowinfosService;

    @RequestMapping("/climpdevicepage.do")
    public String climpdevicepage(HttpServletRequest request) {

        User user= (User) request.getSession().getAttribute("userinfo");

        String s= GetYear.gettimes();

        List<Section> sections = sectionService.findallsection();

        if (user==null) {

            return "login";

        }else {

            request.setAttribute("starttime",s);

            request.setAttribute("sections",sections);

            return "WEB-INF/device/DevicePage";

        }



    }

    //提交购买设备计划表
    @RequestMapping("/applybuydeviceplan.do")
    public @ResponseBody String applybuydeviceplan(HttpServletRequest request,DevicePlan devicePlan,String details,Flowinfos flowinfos) {

        List<DeviceDetail> deviceDetails=new ArrayList<>();

        JSONArray array= JSON.parseArray(details);

        for (int i=0;i<array.size();i++) {

            DeviceDetail deviceDetail=new DeviceDetail();

            JSONObject jsonObject= (JSONObject) array.get(i);

            String devicename=jsonObject.getString("devicename");

            String devicebank=jsonObject.getString("devicebank");

            String devicenum=jsonObject.getString("devicenum");

            deviceDetail.setDevicename(devicename);
            deviceDetail.setDevicebank(devicebank);
            deviceDetail.setDevicenum(devicenum);

            deviceDetails.add(deviceDetail);

        }

        devicePlan.setApplytime1(GetYear.formtim(devicePlan.getApplytime()));

        Integer res = devicePlanService.adddeviceplan(devicePlan);

        if (res==1) {//deviceplan信息添加成功了

            Integer deviceid = devicePlan.getDeviceid();

            for (DeviceDetail d:deviceDetails) {

                d.setDeviceplanid(deviceid);

            }

            Integer res1 = deviceDetailService.adddevicedetailbydetails(deviceDetails);

            if (deviceDetails.size()==res1) {//是否全部添加的数据库

                flowinfos.setFlows(new Flows(devicePlan.getFlowid()));

                flowinfos.setPerson(devicePlan.getApplyperson());

                flowinfos.setFlowabstract(devicePlan.getApplyabstract());

                flowinfos.setStartime1(devicePlan.getApplytime());

                flowinfos.setStartime(devicePlan.getApplytime1());

                flowinfos.setUser(devicePlan.getUser());

                flowinfos.setIncident(devicePlan.getDeviceid());

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

}
