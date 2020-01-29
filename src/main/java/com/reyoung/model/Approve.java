package com.reyoung.model;

/**
 * Created by yangtao on 2020-01-17.
 */
//审批表
public class Approve {

    private Integer approid;

    private User user;

    private Flowinfos flowinfos;

    private String arrivetime;

    private String dealtime;

    private String signature;

    private String suggest;

    private Integer approflag;//审批标志 默认值 0 未审批

    public Approve() {
    }

    public Approve(Integer approid, User user, Flowinfos flowinfos, String arrivetime, String dealtime, String signature, String suggest, Integer approflag) {
        this.approid = approid;
        this.user = user;
        this.flowinfos = flowinfos;
        this.arrivetime = arrivetime;
        this.dealtime = dealtime;
        this.signature = signature;
        this.suggest = suggest;
        this.approflag = approflag;
    }

    public Integer getApproid() {
        return approid;
    }

    public void setApproid(Integer approid) {
        this.approid = approid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Flowinfos getFlowinfos() {
        return flowinfos;
    }

    public void setFlowinfos(Flowinfos flowinfos) {
        this.flowinfos = flowinfos;
    }

    public String getArrivetime() {
        return arrivetime;
    }

    public void setArrivetime(String arrivetime) {
        this.arrivetime = arrivetime;
    }

    public String getDealtime() {
        return dealtime;
    }

    public void setDealtime(String dealtime) {
        this.dealtime = dealtime;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public Integer getApproflag() {
        return approflag;
    }

    public void setApproflag(Integer approflag) {
        this.approflag = approflag;
    }

    @Override
    public String toString() {
        return "Approve{" +
                "approid=" + approid +
                ", user=" + user +
                ", flowinfos=" + flowinfos +
                ", arrivetime=" + arrivetime +
                ", dealtime=" + dealtime +
                ", signature='" + signature + '\'' +
                ", suggest='" + suggest + '\'' +
                ", approflag=" + approflag +
                '}';
    }

}
