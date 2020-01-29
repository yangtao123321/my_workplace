package com.reyoung.pager;

import java.io.Serializable;
import java.util.List;

/**
 * Created by yangtao on 2018-12-23.
 */

public class PageBean<T> implements Serializable {

    //当前页
    private Integer currentPage;

    //每页显示条数
    private Integer pageSize;

    //总记录数 需查询数据库
    private Integer totalRecord;

    //总页数
    private Integer totalPage;

    //分页查询出的数据
    private List<T> list;

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public Integer getTotalPage() {
        return totalPage=(this.getTotalRecord()%this.getPageSize()==0)?(this.getTotalRecord()/this.getPageSize()):(this.getTotalRecord()/this.getPageSize()+1);
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }

}
