package com.reyoung.model.filter;

/**
 * Created by yangtao on 2020-02-13.
 */
public class Fname {

    private Integer filterid;

    private String filtername;

    public Fname() {
    }

    public Fname(Integer filterid, String filtername) {
        this.filterid = filterid;
        this.filtername = filtername;
    }

    public Integer getFilterid() {
        return filterid;
    }

    public void setFilterid(Integer filterid) {
        this.filterid = filterid;
    }

    public String getFiltername() {
        return filtername;
    }

    public void setFiltername(String filtername) {
        this.filtername = filtername;
    }

    @Override
    public String toString() {
        return "Fname{" +
                "filterid=" + filterid +
                ", filtername='" + filtername + '\'' +
                '}';
    }

}
