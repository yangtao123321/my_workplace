package com.reyoung.dao;

import com.reyoung.model.Position;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2019-12-30.
 */
@Repository("positionDao")
public interface PositionDao {

    public List<Position> findallposition();


}
