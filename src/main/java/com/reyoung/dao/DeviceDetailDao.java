package com.reyoung.dao;

import com.reyoung.model.DeviceDetail;
import com.reyoung.model.DevicePlan;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-11.
 */
@Repository("deviceDetailDao")
public interface DeviceDetailDao {

    public Integer adddevicedetailbydetails(@Param("deviceDetails") List<DeviceDetail> deviceDetails);

    public List<DeviceDetail> finddevicedetaillistbydeviceplan(DevicePlan devicePlan);

}
