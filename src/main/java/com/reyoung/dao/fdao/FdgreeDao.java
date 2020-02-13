package com.reyoung.dao.fdao;

import com.reyoung.model.filter.Fdgree;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-13.
 */
@Repository("fdgreeDao")
public interface FdgreeDao {

    public List<Fdgree> findallfdgree();

}
