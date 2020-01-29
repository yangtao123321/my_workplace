package com.reyoung.model;

import java.util.Date;
import java.util.List;

/**
 * Created by yangtao on 2020-01-08.
 */
//滤芯计划实体类
public class FilterPlan {

    private Integer filterid;

    private User user;//

    private String filtertotle;//购买滤芯计划表

    private String applyperson;//申请人

    private String applyreason;//申请原因

    private String applyabstract;//摘要

    private Integer receive;//接收单位

    private String applytime;//发起日期

    private Date applytime1;

    private List<FilterDetail> filterDetails;//采购明细

    private String buyrequires;//采购要求

    private Integer flowid;

    public FilterPlan() {
    }

    public FilterPlan(Integer filterid, User user, String filtertotle, String applyperson, String applyreason, String applyabstract, Integer receive, String applytime, Date applytime1, List<FilterDetail> filterDetails, String buyrequires, Integer flowid) {
        this.filterid = filterid;
        this.user = user;
        this.filtertotle = filtertotle;
        this.applyperson = applyperson;
        this.applyreason = applyreason;
        this.applyabstract = applyabstract;
        this.receive = receive;
        this.applytime = applytime;
        this.applytime1 = applytime1;
        this.filterDetails = filterDetails;
        this.buyrequires = buyrequires;
        this.flowid = flowid;
    }

    public Integer getFilterid() {
        return filterid;
    }

    public void setFilterid(Integer filterid) {
        this.filterid = filterid;
    }

    public String getApplytime() {
        return applytime;
    }

    public void setApplytime(String applytime) {
        this.applytime = applytime;
    }

    public List<FilterDetail> getFilterDetails() {
        return filterDetails;
    }

    public void setFilterDetails(List<FilterDetail> filterDetails) {
        this.filterDetails = filterDetails;
    }

    public String getBuyrequires() {
        return buyrequires;
    }

    public void setBuyrequires(String buyrequires) {
        this.buyrequires = buyrequires;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getFiltertotle() {
        return filtertotle;
    }

    public void setFiltertotle(String filtertotle) {
        this.filtertotle = filtertotle;
    }

    public String getApplyperson() {
        return applyperson;
    }

    public void setApplyperson(String applyperson) {
        this.applyperson = applyperson;
    }

    public String getApplyreason() {
        return applyreason;
    }

    public void setApplyreason(String applyreason) {
        this.applyreason = applyreason;
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

    public Date getApplytime1() {
        return applytime1;
    }

    public void setApplytime1(Date applytime1) {
        this.applytime1 = applytime1;
    }

    public Integer getFlowid() {
        return flowid;
    }

    public void setFlowid(Integer flowid) {
        this.flowid = flowid;
    }

    @Override
    public String toString() {
        return "FilterPlan{" +
                "filterid=" + filterid +
                ", user=" + user +
                ", filtertotle='" + filtertotle + '\'' +
                ", applyperson='" + applyperson + '\'' +
                ", applyreason='" + applyreason + '\'' +
                ", applyabstract='" + applyabstract + '\'' +
                ", receive=" + receive +
                ", applytime='" + applytime + '\'' +
                ", applytime1=" + applytime1 +
                ", filterDetails=" + filterDetails +
                ", buyrequires='" + buyrequires + '\'' +
                ", flowid=" + flowid +
                '}';
    }

}
