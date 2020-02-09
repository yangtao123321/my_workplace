package com.reyoung.model;

import java.util.Date;

/**
 * Created by yangtao on 2020-02-08.
 */
public class RepairePlan {

    private Integer repaireid;

    private User user;

    private String repairetitle;//维修计划表

    private String applyperson;//申请人

    private String applyabstract;//摘要

    private Integer receive;//接收单位

    private String applytime;//发起日期

    private Date applytime1;

    private String contex;

    private String buyrequires;//采购要求

    private String supplier;//供应商

    private Integer flowid;

    public RepairePlan() {
    }

    public RepairePlan(Integer repaireid, User user, String repairetitle, String applyperson, String applyabstract, Integer receive, String applytime, Date applytime1, String contex, String buyrequires, String supplier, Integer flowid) {
        this.repaireid = repaireid;
        this.user = user;
        this.repairetitle = repairetitle;
        this.applyperson = applyperson;
        this.applyabstract = applyabstract;
        this.receive = receive;
        this.applytime = applytime;
        this.applytime1 = applytime1;
        this.contex = contex;
        this.buyrequires = buyrequires;
        this.supplier = supplier;
        this.flowid = flowid;
    }

    public Integer getRepaireid() {
        return repaireid;
    }

    public void setRepaireid(Integer repaireid) {
        this.repaireid = repaireid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRepairetitle() {
        return repairetitle;
    }

    public void setRepairetitle(String repairetitle) {
        this.repairetitle = repairetitle;
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

    public String getBuyrequires() {
        return buyrequires;
    }

    public void setBuyrequires(String buyrequires) {
        this.buyrequires = buyrequires;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getContex() {
        return contex;
    }

    public void setContex(String contex) {
        this.contex = contex;
    }

    public Integer getFlowid() {
        return flowid;
    }

    public void setFlowid(Integer flowid) {
        this.flowid = flowid;
    }

    @Override
    public String toString() {
        return "RepairePlan{" +
                "repaireid=" + repaireid +
                ", user=" + user +
                ", repairetitle='" + repairetitle + '\'' +
                ", applyperson='" + applyperson + '\'' +
                ", applyabstract='" + applyabstract + '\'' +
                ", receive=" + receive +
                ", applytime='" + applytime + '\'' +
                ", applytime1=" + applytime1 +
                ", contex='" + contex + '\'' +
                ", buyrequires='" + buyrequires + '\'' +
                ", supplier='" + supplier + '\'' +
                ", flowid=" + flowid +
                '}';
    }

}
