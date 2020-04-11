package com.pdsk.service.impl;

import com.pdsk.dao.StationQueryDao;
import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.service.TrendAnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Service
public class TrendAnalysisServiceImpl implements TrendAnalysisService {

    @Autowired
    private StationQueryDao stationQueryDao;

    @Override
    public List<StationTobrows> trendAnalysisGet(StationQueryInfo queryInfo) {

        ArrayList<StationTobrows> stationList= new ArrayList<>();

        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");

        Date date;
        String newdata = null;
        String newdata_1 = null;
        try {
            date = formatter.parse(queryInfo.getTimeStart());
            Calendar now =Calendar.getInstance();
            now.setTime(date);
            now.set(Calendar.DATE,now.get(Calendar.DATE)-2);
            Date da = now.getTime();

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            newdata = format.format(da);
            Calendar now_1 =Calendar.getInstance();
            now_1.setTime(date);
            now_1.set(Calendar.DATE,now_1.get(Calendar.DATE)-1);
            Date da_1 = now_1.getTime();

            DateFormat format_1 = new SimpleDateFormat("yyyy-MM-dd");
            newdata_1 = format_1.format(da_1);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //List<StationTobrows> StationTobrows = STDao.findSingleReportbx(newdata+"00:00:00",time1,num,Basestationname);//抚顺版
        List<StationTobrows> StationTobrows = stationQueryDao.findSingleReportbx(queryInfo);
        checkStationList(StationTobrows);

        if(StationTobrows.size()>0){
            DecimalFormat dt = new DecimalFormat("#.000");//保留小数位
            StationTobrows st = StationTobrows.get(0);

            double Q=Double.parseDouble(queryInfo.getStateNoise());    /*动态噪声协方差阵   试算*/
            double R=Double.parseDouble(queryInfo.getObsNoise());    /*观测噪声协方差阵    观测数据统计计算*/
            double x =  st.getsKxAccChange();
            double p_last_x=x*x;/*状态向量协方差阵*/
            double x_last = x;

            double y = st.getsKyAccChange();
            double p_last_y=y*y;/*状态向量协方差阵*/
            double y_last = y;

            double h = st.getsDhAccChange();
            double p_last_h=h*h;/*状态向量协方差阵*/
            double h_last = h;

            for (int i = 0; i < StationTobrows.size(); i++) {
                StationTobrows STobrows = new StationTobrows();
                StationTobrows s =StationTobrows.get(i);

                double x_mid= x_last;
                double p_mid_x = p_last_x + Q;
                double kg_x = p_mid_x/(p_mid_x+R);
                double p_now_x=(1-kg_x)*p_mid_x;//最优值对应的协方差
                double x_old = s.getsKxAccChange();
                double x_now = x_mid+kg_x*(x_old-x_mid);
                p_last_x = p_now_x;
                x_last = x_now;
                Double.parseDouble(dt.format(x_now));

                double y_mid= y_last;
                double p_mid_y = p_last_y + Q;
                double kg_y = p_mid_y/(p_mid_y+R);
                double p_now_y=(1-kg_y)*p_mid_y;//最优值对应的协方差
                double y_old = s.getsKyAccChange();
                double y_now = y_mid+kg_y*(y_old-y_mid);
                p_last_y = p_now_y;
                y_last = y_now;

                double h_mid= h_last;
                double p_mid_h = p_last_h + Q;
                double kg_h = p_mid_h/(p_mid_h+R);
                double p_now_h=(1-kg_h)*p_mid_h;//最优值对应的协方差
                double h_old = s.getsDhAccChange();
                double h_now = h_mid+kg_h*(h_old-h_mid);
                p_last_h = p_now_h;
                h_last = h_now;

                String datas = s.getRecordTime().substring(0, 10);
                if(datas.equals(newdata)||datas.equals(newdata_1)){

                }else{
                    STobrows.setSKxAccChange(Double.parseDouble(dt.format(x_now)));
                    STobrows.setSKyAccChange(Double.parseDouble(dt.format(y_now)));
                    STobrows.setSDhAccChange(Double.parseDouble(dt.format(h_now)));
                    STobrows.setRecordTime(s.getRecordTime());
                    stationList.add(STobrows);
                }

            }
        }

        return stationList;
    }

    private void checkStationList(List<StationTobrows> stationList){
        for(int i=0;i<stationList.size();i++){
            StationTobrows station = stationList.get(i);
            String name= station.getName();
            station.setName(name.substring(name.length()-4,name.length()));
            DecimalFormat df = new DecimalFormat("#.0000"); // #.0保留以为小数 一次类推
            double temp = 0.0;
            temp = Double.parseDouble(df.format(station.getsDhAccChange()*1000));
            station.setSDhAccChange(temp);
            temp = Double.parseDouble(df.format(station.getsKyAccChange()*1000));
            station.setSKyAccChange(temp);
            temp = Double.parseDouble(df.format(station.getsKxAccChange()*1000));
            station.setSKxAccChange(temp);

            temp = Double.parseDouble(df.format(station.getsDhSingleChange()*1000));
            station.setsDhSingleChange(temp);
            temp = Double.parseDouble(df.format(station.getsKxSingleChange()*1000));
            station.setsKxSingleChange(temp);
            temp = Double.parseDouble(df.format(station.getsKySingleChange()*1000));
            station.setsKySingleChange(temp);

            temp = Double.parseDouble(df.format(station.getsDx()));
            station.setsDx(temp);
            temp = Double.parseDouble(df.format(station.getsDy()));
            station.setsDy(temp);
            temp = Double.parseDouble(df.format(station.getsDh()));
            station.setsDh(temp);
        }
    }
}
