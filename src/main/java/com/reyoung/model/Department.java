package com.reyoung.model;

/**
 * Created by yangtao on 2019-12-28.
 */
//部门的信息
public class Department {

    private Integer deptid;

    private String deptname;

    public Department() {
    }

    public Department(Integer deptid, String deptname) {
        this.deptid = deptid;
        this.deptname = deptname;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }


    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptid=" + deptid +
                ", deptname='" + deptname + '\'' +
                '}';
    }

}
