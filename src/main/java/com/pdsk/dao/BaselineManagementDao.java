package com.pdsk.dao;

import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationTobrows;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@Repository
public interface BaselineManagementDao {
    Integer findBaselineRecordCount();
    List<StationTobrows> findBaselineManagement(@Param("start") int start, @Param("size") int size);
    List<SiteQuery> findSiteQuery();
}
