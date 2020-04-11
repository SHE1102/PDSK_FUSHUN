package com.pdsk.service.impl;

import com.pdsk.dao.OnlineMonitorDao;
import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.domain.Time;
import com.pdsk.service.OnlineMonitorService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Service
public class OnlineMonitorServiceImpl implements OnlineMonitorService {

    @Autowired
    private OnlineMonitorDao onlineMonitorDao;

    @Override
    public Time findTime() {
        return onlineMonitorDao.findTime();
    }

    @Override
    public List<StationTobrows> findStationTobrows(String time, String time1,String name) {
        return onlineMonitorDao.findStationTobrows(time,time1,name);
    }

}
