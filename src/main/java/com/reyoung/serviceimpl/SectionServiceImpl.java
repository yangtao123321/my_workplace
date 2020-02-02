package com.reyoung.serviceimpl;

import com.reyoung.dao.SectionDao;
import com.reyoung.model.Section;
import com.reyoung.multidatasource.DataSource;
import com.reyoung.service.SectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yangtao on 2020-01-09.
 */
@Service("sectionService")
@DataSource("dataSource")
public class SectionServiceImpl implements SectionService {

    @Resource(name = "sectionDao")
    private SectionDao sectionDao;

    @Override
    public List<Section> findallsection() {
        return sectionDao.findallsection();
    }

    @Override
    public Section findsectionbyid(Integer sectionid) {

        return sectionDao.findsectionbyid(sectionid);

    }

}
