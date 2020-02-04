package com.reyoung.model;

/**
 * Created by yangtao on 2020-02-03.
 */
//流程图信息的记录
public class FlowPic {

    private String name;

    private Integer appfag;//0未审核 1审核通过 2审核未通过

    public FlowPic() {
    }

    public FlowPic(String name, Integer appfag) {
        this.name = name;
        this.appfag = appfag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAppfag() {
        return appfag;
    }

    public void setAppfag(Integer appfag) {
        this.appfag = appfag;
    }

    @Override
    public String toString() {
        return "FlowPic{" +
                "name='" + name + '\'' +
                ", appfag=" + appfag +
                '}';
    }

}
