package com.reyoung.dao;

import com.reyoung.model.Flows;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-03.
 */
@Repository("flowsDao")
public interface FlowsDao {

    public List<Flows> findallflows();

}
