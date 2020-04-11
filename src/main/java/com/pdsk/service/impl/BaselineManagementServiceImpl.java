package com.pdsk.service.impl;

import com.pdsk.dao.BaselineManagementDao;
import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationTobrows;
import com.pdsk.service.BaselineManagementService;
import com.pdsk.util.Page;
import com.pdsk.util.StationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@Service
public class BaselineManagementServiceImpl implements BaselineManagementService {

    @Autowired
    private BaselineManagementDao baselineManagementDao;

    @Override
    public Page getBaselinePageByPageNum(Integer pageNum) {
        Page page = new Page();
        page.setCurrPageNum(pageNum);//不可省略，页面需要显示
        Integer totalSize = baselineManagementDao.findBaselineRecordCount();
        page.setTotalRecordSize(totalSize);
        int pageSize = page.getPageSize();
        int startNum = (page.getCurrPageNum() - 1) * page.getPageSize();// 计算当前页
        List<StationTobrows> stationList = baselineManagementDao.findBaselineManagement(startNum, pageSize);

        StationUtil stationUtil = new StationUtil();
        List<SiteQuery> siteQueryList = baselineManagementDao.findSiteQuery();
        stationUtil.checkBySiteQuery(stationList,siteQueryList);

        page.setStationList(stationList);
        return page;
    }
}
