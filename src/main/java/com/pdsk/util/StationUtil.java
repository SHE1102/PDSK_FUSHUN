package com.pdsk.util;

import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationTobrows;

import java.text.DecimalFormat;
import java.util.List;

/**
 * Created by Administrator on 2020/3/2 0002.
 */
public class StationUtil {

    public void checkBySiteQuery(List<StationTobrows> stationList, List<SiteQuery> siteQueryList){

        SiteQuery siteQuery = new SiteQuery();
        int size = siteQueryList.size();
        if (size > 0){
            siteQuery = siteQueryList.get(size - 1);
        }

        DecimalFormat df = new DecimalFormat("#.00000"); // #.0保留小数

        for (StationTobrows station : stationList){
            station.setRecordTime(station.getRecordTime().substring(0,13));

            station.setsDx(station.getsKx() - Double.parseDouble(df.format(Double.parseDouble(siteQuery.getOriginalsKx()))));
            station.setsDy(station.getsKy() - Double.parseDouble(df.format(Double.parseDouble(siteQuery.getOriginalsKy()))));
            station.setsDh(station.getsDh() - Double.parseDouble(df.format(Double.parseDouble(siteQuery.getOriginalsDh()))));

            station.setsDhSingleChange(station.getsDhSingleChange() * 1000.0);
            station.setsKxSingleChange(station.getsKxSingleChange() * 1000.0);
            station.setsKySingleChange(station.getsKySingleChange() * 1000.0);
        }
    }
}
