package com.reyoung.model;

/**
 * Created by yangtao on 2020-02-11.
 */
public class DeviceDetail {

    private Integer devicedetailid;

    private String devicename;

    private String devicebank;

    private String devicenum;

    private Integer deviceplanid;

    public DeviceDetail() {
    }

    public DeviceDetail(Integer devicedetailid, String devicename, String devicebank, String devicenum, Integer deviceplanid) {
        this.devicedetailid = devicedetailid;
        this.devicename = devicename;
        this.devicebank = devicebank;
        this.devicenum = devicenum;
        this.deviceplanid = deviceplanid;
    }

    public Integer getDevicedetailid() {
        return devicedetailid;
    }

    public void setDevicedetailid(Integer devicedetailid) {
        this.devicedetailid = devicedetailid;
    }

    public String getDevicename() {
        return devicename;
    }

    public void setDevicename(String devicename) {
        this.devicename = devicename;
    }

    public String getDevicebank() {
        return devicebank;
    }

    public void setDevicebank(String devicebank) {
        this.devicebank = devicebank;
    }

    public String getDevicenum() {
        return devicenum;
    }

    public void setDevicenum(String devicenum) {
        this.devicenum = devicenum;
    }

    public Integer getDeviceplanid() {
        return deviceplanid;
    }

    public void setDeviceplanid(Integer deviceplanid) {
        this.deviceplanid = deviceplanid;
    }

    @Override
    public String toString() {
        return "DeviceDetail{" +
                "devicedetailid=" + devicedetailid +
                ", devicename='" + devicename + '\'' +
                ", devicebank='" + devicebank + '\'' +
                ", devicenum='" + devicenum + '\'' +
                ", deviceplanid=" + deviceplanid +
                '}';
    }

}
