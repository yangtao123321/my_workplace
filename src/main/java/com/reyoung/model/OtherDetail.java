package com.reyoung.model;

/**
 * Created by yangtao on 2020-02-12.
 */
public class OtherDetail {

    private Integer otherdetailid;

    private String otherproname;//品名

    private String othersupplier;//厂家

    private String otherspecial;//规格

    private String othernum;//数量

    private Integer otherplanid;

    public OtherDetail() {
    }

    public OtherDetail(Integer otherdetailid, String otherproname, String othersupplier, String otherspecial, String othernum, Integer otherplanid) {
        this.otherdetailid = otherdetailid;
        this.otherproname = otherproname;
        this.othersupplier = othersupplier;
        this.otherspecial = otherspecial;
        this.othernum = othernum;
        this.otherplanid = otherplanid;
    }

    public Integer getOtherdetailid() {
        return otherdetailid;
    }

    public void setOtherdetailid(Integer otherdetailid) {
        this.otherdetailid = otherdetailid;
    }

    public String getOtherproname() {
        return otherproname;
    }

    public void setOtherproname(String otherproname) {
        this.otherproname = otherproname;
    }

    public String getOthersupplier() {
        return othersupplier;
    }

    public void setOthersupplier(String othersupplier) {
        this.othersupplier = othersupplier;
    }

    public String getOtherspecial() {
        return otherspecial;
    }

    public void setOtherspecial(String otherspecial) {
        this.otherspecial = otherspecial;
    }

    public String getOthernum() {
        return othernum;
    }

    public void setOthernum(String othernum) {
        this.othernum = othernum;
    }

    public Integer getOtherplanid() {
        return otherplanid;
    }

    public void setOtherplanid(Integer otherplanid) {
        this.otherplanid = otherplanid;
    }


    @Override
    public String toString() {
        return "OtherDetail{" +
                "otherdetailid=" + otherdetailid +
                ", otherproname='" + otherproname + '\'' +
                ", othersupplier='" + othersupplier + '\'' +
                ", otherspecial='" + otherspecial + '\'' +
                ", othernum='" + othernum + '\'' +
                ", otherplanid=" + otherplanid +
                '}';
    }

}
