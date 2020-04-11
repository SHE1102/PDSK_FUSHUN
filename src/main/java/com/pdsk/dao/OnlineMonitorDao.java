package com.pdsk.dao;

import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.domain.Time;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Repository
public interface OnlineMonitorDao {
    Time findTime();
    List<StationTobrows> findStationTobrows(@Param("time") String time, @Param("time1")String time1, @Param("name")String name);

}
