package com.reyoung.service;

import com.reyoung.model.Section;

import java.util.List;

/**
 * Created by yangtao on 2020-01-09.
 */
public interface SectionService {

    public List<Section> findallsection();

    public Section findsectionbyid(Integer sectionid);

}
