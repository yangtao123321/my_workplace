package com.reyoung.serviceimpl.fserviceimpl;

import com.reyoung.dao.fdao.FsizeDao;
import com.reyoung.model.filter.Fsize;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.fservice.FsizeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Service("fsizeService")
@DataSource("dataSource")
public class FsizeServiceImpl implements FsizeService {

    @Resource(name ="fsizeDao")
    private FsizeDao fsizeDao;

    @Override
    public List<Fsize> findallfsize() {

        return fsizeDao.findallfsize();

    }
}
