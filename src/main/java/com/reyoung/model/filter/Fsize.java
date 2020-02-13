package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-13.
 */
public class Fsize {

    private Integer fsizeid;

    private String fsizename;

    public Fsize() {

    }

    public Fsize(Integer fsizeid, String fsizename) {
        this.fsizeid = fsizeid;
        this.fsizename = fsizename;
    }

    public Integer getFsizeid() {
        return fsizeid;
    }

    public void setFsizeid(Integer fsizeid) {
        this.fsizeid = fsizeid;
    }

    public String getFsizename() {
        return fsizename;
    }

    public void setFsizename(String fsizename) {
        this.fsizename = fsizename;
    }

    @Override
    public String toString() {
        return "Fsize{" +
                "fsizeid=" + fsizeid +
                ", fsizename='" + fsizename + '\'' +
                '}';
    }

}
