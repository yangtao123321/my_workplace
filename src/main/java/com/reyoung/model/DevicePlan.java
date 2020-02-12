package com.reyoung.model;

import java.util.Date;
import java.util.List;

/**
 * Created by yangtao on 2020-02-11.
 */
public class DevicePlan {

    private Integer deviceid;

    private User user;

    private String devicetitle;//购买设备计划表

    private String applyperson;//申请人

    private String applyabstract;//摘要

    private Integer receive;//接收单位

    private String applytime;//发起日期

    private Date applytime1;

    private String buyreson;//购买原因

    private Integer flowid;

    private List<DeviceDetail> deviceDetails;

    public DevicePlan() {
    }

    public DevicePlan(Integer deviceid, User user, String devicetitle, String applyperson, String applyabstract, Integer receive, String applytime, Date applytime1, String buyreson, Integer flowid, List<DeviceDetail> deviceDetails) {
        this.deviceid = deviceid;
        this.user = user;
        this.devicetitle = devicetitle;
        this.applyperson = applyperson;
        this.applyabstract = applyabstract;
        this.receive = receive;
        this.applytime = applytime;
        this.applytime1 = applytime1;
        this.buyreson = buyreson;
        this.flowid = flowid;
        this.deviceDetails = deviceDetails;
    }

    public Integer getDeviceid() {
        return deviceid;
    }

    public void setDeviceid(Integer deviceid) {
        this.deviceid = deviceid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDevicetitle() {
        return devicetitle;
    }

    public void setDevicetitle(String devicetitle) {
        this.devicetitle = devicetitle;
    }

    public String getApplyperson() {
        return applyperson;
    }

    public void setApplyperson(String applyperson) {
        this.applyperson = applyperson;
    }

    public String getApplyabstract() {
        return applyabstract;
    }

    public void setApplyabstract(String applyabstract) {
        this.applyabstract = applyabstract;
    }

    public Integer getReceive() {
        return receive;
    }

    public void setReceive(Integer receive) {
        this.receive = receive;
    }

    public String getApplytime() {
        return applytime;
    }

    public void setApplytime(String applytime) {
        this.applytime = applytime;
    }

    public Date getApplytime1() {
        return applytime1;
    }

    public void setApplytime1(Date applytime1) {
        this.applytime1 = applytime1;
    }

    public String getBuyreson() {
        return buyreson;
    }

    public void setBuyreson(String buyreson) {
        this.buyreson = buyreson;
    }

    public Integer getFlowid() {
        return flowid;
    }

    public void setFlowid(Integer flowid) {
        this.flowid = flowid;
    }

    public List<DeviceDetail> getDeviceDetails() {
        return deviceDetails;
    }

    public void setDeviceDetails(List<DeviceDetail> deviceDetails) {
        this.deviceDetails = deviceDetails;
    }

    @Override
    public String toString() {
        return "DevicePlan{" +
                "deviceid=" + deviceid +
                ", user=" + user +
                ", devicetitle='" + devicetitle + '\'' +
                ", applyperson='" + applyperson + '\'' +
                ", applyabstract='" + applyabstract + '\'' +
                ", receive=" + receive +
                ", applytime='" + applytime + '\'' +
                ", applytime1=" + applytime1 +
                ", buyreson='" + buyreson + '\'' +
                ", flowid=" + flowid +
                ", deviceDetails=" + deviceDetails +
                '}';
    }

}
