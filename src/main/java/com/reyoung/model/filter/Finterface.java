package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-13.
 */
public class Finterface {

    private Integer finterfaceid;

    private String finterfacename;

    public Finterface() {
    }

    public Finterface(Integer finterfaceid, String finterfacename) {
        this.finterfaceid = finterfaceid;
        this.finterfacename = finterfacename;
    }

    public String getFinterfacename() {
        return finterfacename;
    }

    public void setFinterfacename(String finterfacename) {
        this.finterfacename = finterfacename;
    }

    public Integer getFinterfaceid() {
        return finterfaceid;
    }

    public void setFinterfaceid(Integer finterfaceid) {
        this.finterfaceid = finterfaceid;
    }


    @Override
    public String toString() {
        return "Finterface{" +
                "finterfaceid=" + finterfaceid +
                ", finterfacename='" + finterfacename + '\'' +
                '}';
    }

}
