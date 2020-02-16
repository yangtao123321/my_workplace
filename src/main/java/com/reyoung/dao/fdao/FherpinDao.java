package com.reyoung.dao.fdao;

import com.reyoung.model.filter.Fherpin;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-14.
 */
@Repository("fherpinDao")
public interface FherpinDao {

    public List<Fherpin> findallfherpin();

}
