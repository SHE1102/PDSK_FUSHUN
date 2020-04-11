package com.pdsk.dao;

import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2020/2/18 0018.
 */
@Repository
public interface StationQueryDao {
    //监测站分页总数查询
    int findSingleMonitorStationsCount(StationQueryInfo monitorStationInfo);

    //监测站查询
    List<StationTobrows> findSingleMonitorStations(StationQueryInfo monitorStationInfo) ;


    List<StationTobrows> findSingleReportbx(StationQueryInfo queryInfo);

}
