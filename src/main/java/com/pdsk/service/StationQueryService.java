package com.pdsk.service;

import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.util.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2020/2/18 0018.
 */
public interface StationQueryService {
    Page findPageByQueryInfo(StationQueryInfo stationQueryInfo);

    Page findPageListByQueryInfo(StationQueryInfo stationQueryInfo);
    ArrayList<StationTobrows> find24timeSingleMonitoringStations(StationQueryInfo stationQueryInfo);

    void checkQueryInfo(StationQueryInfo queryInfo);

    List<StationTobrows> findSingleReportbx(StationQueryInfo queryInfo);
}
