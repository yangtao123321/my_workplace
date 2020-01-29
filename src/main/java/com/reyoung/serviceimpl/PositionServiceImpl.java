package com.reyoung.serviceimpl;

import com.reyoung.dao.PositionDao;
import com.reyoung.model.Position;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
@Service("positionService")
@DataSource("dataSource")
public class PositionServiceImpl implements PositionService {

    @Resource(name = "positionDao")
    private PositionDao positionDao;

    @Override
    public List<Position> findallposition() {
        return positionDao.findallposition();
    }

}
