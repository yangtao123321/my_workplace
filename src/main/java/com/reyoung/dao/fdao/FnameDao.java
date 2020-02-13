package com.reyoung.dao.fdao;

import com.reyoung.model.filter.Fname;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Repository("fnameDao")
public interface FnameDao {

    public List<Fname> findallfname();

}
