package com.reyoung.model;

/**
 * Created by yangtao on 2020-01-08.
 */
//滤芯明细实体类
public class FilterDetail {

    private Integer fdetailid;

    private String fdetailname;//名称

    private String fdetailsize;//尺寸

    private String fdgree;//精度

    private String fdetailinterface;//接口

    private String fherpin;//膜层数

    private String fdetailnum;//数量

    private String useing;//用途

    private Integer fid;//filterplan的主键

    public FilterDetail() {
    }

    public FilterDetail(Integer fdetailid, String fdetailname, String fdetailsize, String fdgree, String fdetailinterface, String fherpin, String fdetailnum, String useing, Integer fid) {
        this.fdetailid = fdetailid;
        this.fdetailname = fdetailname;
        this.fdetailsize = fdetailsize;
        this.fdgree = fdgree;
        this.fdetailinterface = fdetailinterface;
        this.fherpin = fherpin;
        this.fdetailnum = fdetailnum;
        this.useing = useing;
        this.fid = fid;
    }

    public Integer getFdetailid() {
        return fdetailid;
    }

    public void setFdetailid(Integer fdetailid) {
        this.fdetailid = fdetailid;
    }

    public String getFdetailname() {
        return fdetailname;
    }

    public void setFdetailname(String fdetailname) {
        this.fdetailname = fdetailname;
    }

    public String getFdetailsize() {
        return fdetailsize;
    }

    public void setFdetailsize(String fdetailsize) {
        this.fdetailsize = fdetailsize;
    }

    public String getFdetailinterface() {
        return fdetailinterface;
    }

    public void setFdetailinterface(String fdetailinterface) {
        this.fdetailinterface = fdetailinterface;
    }

    public String getFdetailnum() {
        return fdetailnum;
    }

    public void setFdetailnum(String fdetailnum) {
        this.fdetailnum = fdetailnum;
    }

    public String getUseing() {
        return useing;
    }

    public void setUseing(String useing) {
        this.useing = useing;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFdgree() {
        return fdgree;
    }

    public void setFdgree(String fdgree) {
        this.fdgree = fdgree;
    }

    public String getFherpin() {
        return fherpin;
    }

    public void setFherpin(String fherpin) {
        this.fherpin = fherpin;
    }

    @Override
    public String toString() {
        return "FilterDetail{" +
                "fdetailid=" + fdetailid +
                ", fdetailname='" + fdetailname + '\'' +
                ", fdetailsize='" + fdetailsize + '\'' +
                ", fdgree='" + fdgree + '\'' +
                ", fdetailinterface='" + fdetailinterface + '\'' +
                ", fherpin='" + fherpin + '\'' +
                ", fdetailnum='" + fdetailnum + '\'' +
                ", useing='" + useing + '\'' +
                ", fid=" + fid +
                '}';
    }

}
