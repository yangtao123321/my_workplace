package com.reyoung.dao;

import com.reyoung.model.Flowinfos;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-01-16.
 */
@Repository("flowinfosDao")
public interface FlowinfosDao {

    public Integer addflowinfo(Flowinfos flowinfos);

    public List<Flowinfos> findallflowinfos();

    public Flowinfos findflwoinfobyfid(Flowinfos flowinfos);

}
