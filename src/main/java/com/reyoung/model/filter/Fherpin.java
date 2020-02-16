package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-14.
 */
public class Fherpin {

    private Integer fherpinid;

    private String fherpinname;

    public Fherpin() {
    }

    public Fherpin(Integer fherpinid, String fherpinname) {
        this.fherpinid = fherpinid;
        this.fherpinname = fherpinname;
    }

    public Integer getFherpinid() {
        return fherpinid;
    }

    public void setFherpinid(Integer fherpinid) {
        this.fherpinid = fherpinid;
    }

    public String getFherpinname() {
        return fherpinname;
    }

    public void setFherpinname(String fherpinname) {
        this.fherpinname = fherpinname;
    }

    @Override
    public String toString() {
        return "Fherpin{" +
                "fherpinid=" + fherpinid +
                ", fherpinname='" + fherpinname + '\'' +
                '}';
    }

}
