package com.reyoung.model;

/**
 * Created by yangtao on 2020-01-09.
 */
public class Flows {

    private Integer flowid;

    private String flowname;

    public Flows() {

    }

    public Flows(Integer flowid) {
        this.flowid = flowid;
    }

    public Flows(Integer flowid, String flowname) {
        this.flowid = flowid;
        this.flowname = flowname;
    }

    public Integer getFlowid() {
        return flowid;
    }

    public void setFlowid(Integer flowid) {
        this.flowid = flowid;
    }

    public String getFlowname() {
        return flowname;
    }

    public void setFlowname(String flowname) {
        this.flowname = flowname;
    }

    @Override
    public String toString() {
        return "Flows{" +
                "flowid=" + flowid +
                ", flowname='" + flowname + '\'' +
                '}';
    }

}
