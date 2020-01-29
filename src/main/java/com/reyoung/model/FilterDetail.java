package com.reyoung.model;

/**
 * Created by yangtao on 2020-01-08.
 */
//滤芯明细实体类
public class FilterDetail {

    private Integer fdetailid;

    private String fdetailname;//材质

    private String fdetailtype;//型号

    private String fdetailsize;//尺寸

    private String fdetailinterface;//接口

    private String fdetailnum;//数量

    private String rek;//要求

    private String useing;//用途

    private Integer fid;//filterplan的主键

    public FilterDetail() {
    }

    public FilterDetail(Integer fdetailid, String fdetailname, String fdetailtype, String fdetailsize, String fdetailinterface, String fdetailnum, String rek, String useing, Integer fid) {
        this.fdetailid = fdetailid;
        this.fdetailname = fdetailname;
        this.fdetailtype = fdetailtype;
        this.fdetailsize = fdetailsize;
        this.fdetailinterface = fdetailinterface;
        this.fdetailnum = fdetailnum;
        this.rek = rek;
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

    public String getFdetailtype() {
        return fdetailtype;
    }

    public void setFdetailtype(String fdetailtype) {
        this.fdetailtype = fdetailtype;
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

    public String getRek() {
        return rek;
    }

    public void setRek(String rek) {
        this.rek = rek;
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

    @Override
    public String toString() {
        return "FilterDetail{" +
                "fdetailid=" + fdetailid +
                ", fdetailname='" + fdetailname + '\'' +
                ", fdetailtype='" + fdetailtype + '\'' +
                ", fdetailsize='" + fdetailsize + '\'' +
                ", fdetailinterface='" + fdetailinterface + '\'' +
                ", fdetailnum='" + fdetailnum + '\'' +
                ", rek='" + rek + '\'' +
                ", useing='" + useing + '\'' +
                ", fid=" + fid +
                '}';
    }

}
