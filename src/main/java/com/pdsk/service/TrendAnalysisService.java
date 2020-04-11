package com.pdsk.service;

import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;

import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
public interface TrendAnalysisService {
    List<StationTobrows> trendAnalysisGet(StationQueryInfo queryInfo);
}
