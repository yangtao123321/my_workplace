package com.reyoung.serviceimpl;

import com.reyoung.dao.DeviceDetailDao;
import com.reyoung.model.DeviceDetail;
import com.reyoung.model.DevicePlan;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.DeviceDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-11.
 */
@Service("deviceDetailService")
@DataSource("dataSource")
public class DeviceDetailServiceImpl implements DeviceDetailService {

    @Resource(name = "deviceDetailDao")
    private DeviceDetailDao deviceDetailDao;

    @Override
    public Integer adddevicedetailbydetails(List<DeviceDetail> deviceDetails) {

        return deviceDetailDao.adddevicedetailbydetails(deviceDetails);

    }

    @Override
    public List<DeviceDetail> finddevicedetaillistbydeviceplan(DevicePlan devicePlan) {
        return deviceDetailDao.finddevicedetaillistbydeviceplan(devicePlan);
    }

}
