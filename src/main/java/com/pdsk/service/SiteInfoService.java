package com.pdsk.service;

import com.pdsk.domain.BaseStation;
import com.pdsk.domain.SiteQuery;
import com.pdsk.util.Page;

import java.util.List;

/**
 * Created by Administrator on 2020/2/11 0011.
 */
public interface SiteInfoService {
    Page getSiteInfoByPageNum(int pageNum);
    boolean deleteSiteById(String id);
    boolean insertSite(SiteQuery siteQuery);
    boolean updateSite(SiteQuery siteQuery);
    List<SiteQuery> findSiteNameList();
    List<BaseStation> findAllBaseStation();
}
