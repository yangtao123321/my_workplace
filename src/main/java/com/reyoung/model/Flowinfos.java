package com.reyoung.model;

import java.util.Date;

/**
 * Created by yangtao on 2020-01-09.
 */
//流程信息类 T代表 滤芯计划、维修保养计划、其他采购计划
public class Flowinfos {

    private Integer flowinfoid;//流程号

    private Flows flows;//所属的流程

    private String flowabstract;//流程内容摘要

    private String person;//提报人 手动填写的

    private String startime1;

    private Date startime;//发起时间

    private Date endtime;//结束时间

    private User user;//经办人的申请单位

    private Integer incident;//具体流程详情的id号 如filterplanid

    private Integer flag;//审批的标志

    private Approve approve;//添加单条审批记录

    private Integer achieve;//完成的标志 默认为0 未完成  1表示已完成

    public Flowinfos() {



    }

    public Flowinfos(Integer flowinfoid, Flows flows, String flowabstract, String person, String startime1, Date startime, Date endtime, User user, Integer incident, Integer flag, Approve approve, Integer achieve) {
        this.flowinfoid = flowinfoid;
        this.flows = flows;
        this.flowabstract = flowabstract;
        this.person = person;
        this.startime1 = startime1;
        this.startime = startime;
        this.endtime = endtime;
        this.user = user;
        this.incident = incident;
        this.flag = flag;
        this.approve = approve;
        this.achieve = achieve;
    }

    public Integer getFlowinfoid() {
        return flowinfoid;
    }

    public void setFlowinfoid(Integer flowinfoid) {
        this.flowinfoid = flowinfoid;
    }

    public Flows getFlows() {
        return flows;
    }

    public void setFlows(Flows flows) {
        this.flows = flows;
    }

    public String getFlowabstract() {
        return flowabstract;
    }

    public void setFlowabstract(String flowabstract) {
        this.flowabstract = flowabstract;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getIncident() {
        return incident;
    }

    public void setIncident(Integer incident) {
        this.incident = incident;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Approve getApprove() {
        return approve;
    }

    public void setApprove(Approve approve) {
        this.approve = approve;
    }

    public Integer getAchieve() {
        return achieve;
    }

    public void setAchieve(Integer achieve) {
        this.achieve = achieve;
    }

    public String getStartime1() {
        return startime1;
    }

    public void setStartime1(String startime1) {
        this.startime1 = startime1;
    }

    @Override
    public String toString() {
        return "Flowinfos{" +
                "flowinfoid=" + flowinfoid +
                ", flows=" + flows +
                ", flowabstract='" + flowabstract + '\'' +
                ", person='" + person + '\'' +
                ", startime1='" + startime1 + '\'' +
                ", startime=" + startime +
                ", endtime=" + endtime +
                ", user=" + user +
                ", incident=" + incident +
                ", flag=" + flag +
                ", approve=" + approve +
                ", achieve=" + achieve +
                '}';
    }

}
