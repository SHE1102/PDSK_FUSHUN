package com.pdsk.service.impl;

import com.pdsk.dao.SiteInfoDao;
import com.pdsk.domain.BaseStation;
import com.pdsk.domain.SiteQuery;
import com.pdsk.service.SiteInfoService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2020/2/11 0011.
 */
@Service
public class SiteInfoServiceImpl implements SiteInfoService {

    @Autowired
    private SiteInfoDao siteInfoDao;

    @Override
    public Page getSiteInfoByPageNum(int pageNum) {

        Page page = new Page();
        page.setCurrPageNum(pageNum);

        int totalCount = siteInfoDao.getSiteRecordTotalCount();
        page.setTotalRecordSize(totalCount);

        int pageStart = (page.getCurrPageNum() - 1) * page.getPageSize();// 计算当前页
        int pageSize = page.getPageSize();
        List<SiteQuery> siteInfoList = siteInfoDao.findSiteListByPage(pageStart, pageSize);
        page.setSiteInfoList(siteInfoList);
        return page;
    }

    @Override
    public boolean deleteSiteById(String id) {
        return siteInfoDao.deleteSiteById(id);
    }

    //需要转换WGS坐标
    @Override
    public boolean insertSite(SiteQuery siteQuery) {
        return siteInfoDao.insertSite(siteQuery);
    }

    @Override
    public boolean updateSite(SiteQuery siteQuery) {
        return siteInfoDao.updateSite(siteQuery);
    }

    @Override
    public List<SiteQuery> findSiteNameList() {
        return siteInfoDao.findSiteNameList();
    }

    @Override
    public List<BaseStation> findAllBaseStation() {
        return siteInfoDao.findAllBaseStation();
    }
}
