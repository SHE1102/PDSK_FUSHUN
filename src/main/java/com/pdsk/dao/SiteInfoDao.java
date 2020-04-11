package com.pdsk.dao;

import com.pdsk.domain.BaseStation;
import com.pdsk.domain.SiteQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2020/2/11 0011.
 */
@Repository
public interface SiteInfoDao {
    Integer getSiteRecordTotalCount();
    List<SiteQuery> findSiteListByPage(@Param("start")int start, @Param("size")int size);
    List<SiteQuery> findSiteNameList();
    List<BaseStation> findAllBaseStation();

    boolean deleteSiteById(@Param("id")String id);
    boolean insertSite(SiteQuery siteQuery);
    boolean updateSite(SiteQuery siteQuery);


}
