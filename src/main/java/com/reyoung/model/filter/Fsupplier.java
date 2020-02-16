package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-14.
 */
public class Fsupplier {

    private Integer fsupplierid;

    private String fsuppliername;

    public Fsupplier() {
    }

    public Fsupplier(Integer fsupplierid, String fsuppliername) {
        this.fsupplierid = fsupplierid;
        this.fsuppliername = fsuppliername;
    }

    public Integer getFsupplierid() {
        return fsupplierid;
    }

    public void setFsupplierid(Integer fsupplierid) {
        this.fsupplierid = fsupplierid;
    }

    public String getFsuppliername() {
        return fsuppliername;
    }

    public void setFsuppliername(String fsuppliername) {
        this.fsuppliername = fsuppliername;
    }

    @Override
    public String toString() {
        return "Fsupplier{" +
                "fsupplierid=" + fsupplierid +
                ", fsuppliername='" + fsuppliername + '\'' +
                '}';
    }



}
