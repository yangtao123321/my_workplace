package com.reyoung.model;

/**
 * Created by yangtao on 2020-01-09.
 */
//部门信息表
public class Section {

    private Integer sectionid;

    private String sectionname;

    public Section() {
    }

    public Section(Integer sectionid, String sectionname) {
        this.sectionid = sectionid;
        this.sectionname = sectionname;
    }

    public Integer getSectionid() {
        return sectionid;
    }

    public void setSectionid(Integer sectionid) {
        this.sectionid = sectionid;
    }

    public String getSectionname() {
        return sectionname;
    }

    public void setSectionname(String sectionname) {
        this.sectionname = sectionname;
    }

    @Override
    public String toString() {
        return "Section{" +
                "sectionid=" + sectionid +
                ", sectionname='" + sectionname + '\'' +
                '}';
    }

}
