package com.reyoung.model;

/**
 * Created by yangtao on 2019-12-28.
 */
//职位信息表
public class Position {

    private Integer posid;

    private String posname;

    private Integer approflag;

    private Integer agreeflag;

    private Integer backflag;

    public Position() {
    }

    public Position(Integer posid, String posname, Integer approflag, Integer agreeflag, Integer backflag) {
        this.posid = posid;
        this.posname = posname;
        this.approflag = approflag;
        this.agreeflag = agreeflag;
        this.backflag = backflag;
    }

    public Integer getPosid() {
        return posid;
    }

    public void setPosid(Integer posid) {
        this.posid = posid;
    }

    public String getPosname() {
        return posname;
    }

    public void setPosname(String posname) {
        this.posname = posname;
    }

    public Integer getApproflag() {
        return approflag;
    }

    public void setApproflag(Integer approflag) {
        this.approflag = approflag;
    }

    public Integer getAgreeflag() {
        return agreeflag;
    }

    public void setAgreeflag(Integer agreeflag) {
        this.agreeflag = agreeflag;
    }

    public Integer getBackflag() {
        return backflag;
    }

    public void setBackflag(Integer backflag) {
        this.backflag = backflag;
    }

    @Override
    public String toString() {
        return "Position{" +
                "posid=" + posid +
                ", posname='" + posname + '\'' +
                ", approflag=" + approflag +
                ", agreeflag=" + agreeflag +
                ", backflag=" + backflag +
                '}';
    }

}
