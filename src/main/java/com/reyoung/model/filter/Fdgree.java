package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-13.
 */
public class Fdgree {

    private Integer fdgreeid;

    private String fdgreename;

    public Fdgree() {
    }

    public Fdgree(Integer fdgreeid, String fdgreename) {
        this.fdgreeid = fdgreeid;
        this.fdgreename = fdgreename;
    }

    public Integer getFdgreeid() {
        return fdgreeid;
    }

    public void setFdgreeid(Integer fdgreeid) {
        this.fdgreeid = fdgreeid;
    }

    public String getFdgreename() {
        return fdgreename;
    }

    public void setFdgreename(String fdgreename) {
        this.fdgreename = fdgreename;
    }

    @Override
    public String toString() {
        return "Fdgree{" +
                "fdgreeid=" + fdgreeid +
                ", fdgreename='" + fdgreename + '\'' +
                '}';
    }

}
