package com.reyoung.dao;

import com.reyoung.model.Section;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yangtao on 2020-01-09.
 */
@Repository("sectionDao")
public interface SectionDao {

    public List<Section> findallsection();

    public Section findsectionbyid(Integer sectionid);


}
