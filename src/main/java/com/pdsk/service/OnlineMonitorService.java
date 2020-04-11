package com.pdsk.service;

import com.pdsk.domain.StationTobrows;
import com.pdsk.domain.Time;
import com.pdsk.util.Page;

import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
public interface OnlineMonitorService {
    Time findTime();
    List<StationTobrows> findStationTobrows(String time, String time1,String name);
}
