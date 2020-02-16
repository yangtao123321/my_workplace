package com.reyoung.dao.fdao;

import com.reyoung.model.filter.Fsupplier;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-02-14.
 */
@Repository("fsupplierDao")
public interface FsupplierDao {

    public List<Fsupplier> findallfsupplier();

}
