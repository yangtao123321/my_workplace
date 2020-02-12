package com.reyoung.model;

import java.util.Date;
import java.util.List;

/**
 * Created by yangtao on 2020-02-12.
 */
public class OtherPlan {

    private Integer otherplanid;

    private User user;

    private String othertitle;//购买设备计划表

    private String applyperson;//申请人

    private String applyabstract;//摘要

    private Integer receive;//接收单位

    private String applytime;//发起日期

    private Date applytime1;

    private String buyreson;//购买原因

    private Integer flowid;


    private List<OtherDetail> otherDetails;


    public OtherPlan() {
    }

    public OtherPlan(Integer otherplanid, User user, String othertitle, String applyperson, String applyabstract, Integer receive, String applytime, Date applytime1, String buyreson, Integer flowid, List<OtherDetail> otherDetails) {
        this.otherplanid = otherplanid;
        this.user = user;
        this.othertitle = othertitle;
        this.applyperson = applyperson;
        this.applyabstract = applyabstract;
        this.receive = receive;
        this.applytime = applytime;
        this.applytime1 = applytime1;
        this.buyreson = buyreson;
        this.flowid = flowid;
        this.otherDetails = otherDetails;
    }


    public Integer getOtherplanid() {
        return otherplanid;
    }

    public void setOtherplanid(Integer otherplanid) {
        this.otherplanid = otherplanid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOthertitle() {
        return othertitle;
    }

    public void setOthertitle(String othertitle) {
        this.othertitle = othertitle;
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

    public List<OtherDetail> getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(List<OtherDetail> otherDetails) {
        this.otherDetails = otherDetails;
    }


    @Override
    public String toString() {
        return "OtherPlan{" +
                "otherplanid=" + otherplanid +
                ", user=" + user +
                ", othertitle='" + othertitle + '\'' +
                ", applyperson='" + applyperson + '\'' +
                ", applyabstract='" + applyabstract + '\'' +
                ", receive=" + receive +
                ", applytime='" + applytime + '\'' +
                ", applytime1=" + applytime1 +
                ", buyreson='" + buyreson + '\'' +
                ", flowid=" + flowid +
                ", otherDetails=" + otherDetails +
                '}';
    }

}
