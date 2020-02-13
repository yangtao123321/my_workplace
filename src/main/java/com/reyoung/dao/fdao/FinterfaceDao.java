package com.reyoung.dao.fdao;

import com.reyoung.model.filter.Finterface;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Repository("finterfaceDao")
public interface FinterfaceDao {

    public List<Finterface> findallfinterface();

}
