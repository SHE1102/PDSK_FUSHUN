package com.pdsk.service.impl;

import com.pdsk.dao.StationQueryDao;
import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.service.StationQueryService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;

/**
 * Created by Administrator on 2020/2/18 0018.
 */
@Service
public class StationQueryServiceImpl implements StationQueryService{

    @Autowired
    private StationQueryDao stationQueryDao;

    @Override
    public Page findPageByQueryInfo(StationQueryInfo station) {
        checkQueryInfo(station);

        Page page = null;

        //如果 X Y H 什么都不选进入判断
        if(station.getX().equals("0") && station.getY().equals("0") && station.getH().equals("0")){
            station.setModel("1");
            page = findSingleMonitoringStations(station);
        }else{
            if(station.getThreshold() != null){
                page = findSingleMonitoringStations(station);
            }
        }

        return page;
    }

    public Page findSingleMonitoringStations(StationQueryInfo queryInfo){

        queryInfo.setConditionList();
        Page page = new Page();
        page.setCurrPageNum(Integer.parseInt(queryInfo.getCurrPageNum()));// 当前页数

        int pageSize = page.getPageSize();// 每页显示数；
        int pageStart = (page.getCurrPageNum() - 1) * page.getPageSize();// 计算当前页

        queryInfo.setPageStart(pageStart);
        queryInfo.setPageSize(pageSize);

        int pageTotalCount = stationQueryDao.findSingleMonitorStationsCount(queryInfo);
        page.setTotalRecordSize(pageTotalCount);

        List<StationTobrows> stationList = stationQueryDao.findSingleMonitorStations(queryInfo);
        checkStationList(stationList);
        page.setStationList(stationList);

        return page;
    }

    @Override
    public void checkQueryInfo(StationQueryInfo queryInfo) {
        if(queryInfo.getX() == null || queryInfo.getX() == ""){
            queryInfo.setX("0");
        }
        if(queryInfo.getY() == null || queryInfo.getY() == ""){
            queryInfo.setY("0");
        }
        if(queryInfo.getH() == null || queryInfo.getH() == ""){
            queryInfo.setH("0");
        }

        //转换阈值单位
        if(queryInfo.getThreshold() != ""){
            String thresholdUse = String.valueOf(Double.parseDouble(queryInfo.getThreshold())/1000);
            queryInfo.setThresholdUse(thresholdUse);
        }

        //处理起止时间
        if(queryInfo.getTimeEnd() !=null){
            queryInfo.setTimeEnd(queryInfo.getTimeEnd().trim());
        }

        //基准站组装(抚顺版) //基准站 + 监测站
        String pairName = queryInfo.getBaseStationName() + "-" + queryInfo.getMonitorStationName();
        queryInfo.setPairName(pairName);

        //处理访页面 // 默认用户访问第1页
        if (queryInfo.getCurrPageNum() == null || queryInfo.getCurrPageNum() == "") {
            queryInfo.setCurrPageNum("1");
        }
    }

    @Override
    public List<StationTobrows> findSingleReportbx(StationQueryInfo queryInfo) {
        List<StationTobrows> stationList = stationQueryDao.findSingleReportbx(queryInfo);
        checkStationList(stationList);

        return stationList;
    }

    @Override
    public Page findPageListByQueryInfo(StationQueryInfo queryInfo) {

        List<StationTobrows> st = findSingleMonitoringStationsnei(queryInfo);
        //条件时段内数据查询
        List<StationTobrows> tt = new ArrayList<>();

        if ("0".equals(queryInfo.getX()) && "0".equals(queryInfo.getY()) && "0".equals(queryInfo.getH())){
            tt = st;
        }

        double num = Double.parseDouble(queryInfo.getThreshold());

        //X方向判断
        if(queryInfo.getX().equals("1")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if(Tobrows.getsKxAccChange()>num||Tobrows.getsKxAccChange()<-num){
                    tt.add(Tobrows);
                }
            }
        }
        //Y方向判断
        if(queryInfo.getY().equals("2")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if(Tobrows.getsKyAccChange()>num||Tobrows.getsKyAccChange()<-num){
                    tt.add(Tobrows);
                }
            }
        }
        //H方向判断
        if(queryInfo.getH().equals("3")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if(Tobrows.getsDhAccChange()>num||Tobrows.getsDhAccChange()<-num){
                    tt.add(Tobrows);
                }
            }
        }
        //XY方向判断
        if(queryInfo.getX().equals("1")&&queryInfo.getY().equals("2")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if((Tobrows.getsKyAccChange()>num||Tobrows.getsKyAccChange()<-num)&&(Tobrows.getsKxAccChange()>num||Tobrows.getsKxAccChange()<-num)){
                    tt.add(Tobrows);
                }
            }
        }
        //XH方向判断
        if(queryInfo.getX().equals("1")&&queryInfo.getH().equals("3")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if((Tobrows.getsDhAccChange()>num||Tobrows.getsDhAccChange()<-num)&&(Tobrows.getsKxAccChange()>num||Tobrows.getsKxAccChange()<-num)){
                    tt.add(Tobrows);
                }
            }
        }
        //YH方向判断
        if(queryInfo.getH().equals("3")&&queryInfo.getY().equals("2")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if((Tobrows.getsKyAccChange()>num||Tobrows.getsKyAccChange()<-num)&&(Tobrows.getsDhAccChange()>num||Tobrows.getsDhAccChange()<-num)){
                    tt.add(Tobrows);
                }
            }
        }
        //XYH方向判断
        if(queryInfo.getX().equals("1")&&queryInfo.getH().equals("3")&&queryInfo.getY().equals("2")){
            tt.clear();
            for (int i = 0; i < st.size(); i++) {
                StationTobrows Tobrows = st.get(i);
                if((Tobrows.getsKyAccChange()>num||Tobrows.getsKyAccChange()<-num)&&(Tobrows.getsDhAccChange()>num||Tobrows.getsDhAccChange()<-num)&&(Tobrows.getsKyAccChange()>num||Tobrows.getsKyAccChange()<-num)){
                    tt.add(Tobrows);
                }
            }
        }

        int currPageNum = Integer.parseInt(queryInfo.getCurrPageNum());

        Page page = new Page();
        page.setCurrPageNum(currPageNum);// 当前页数
        page.setTotalRecordSize(tt.size());

        int pageSize = page.getPageSize();// 每页显示数；
        int pageStart = (page.getCurrPageNum() - 1) * page.getPageSize();// 计算当前页
        int pageEnd = pageStart + pageSize;

        List<StationTobrows>  Station=  new ArrayList<>();

        //从列表中选出符合的记录
        for (int i = 0; i < tt.size(); i++) {
            if(pageStart <=i && i<pageEnd){
                Station.add(tt.get(i));
            }
        }

        page.setStationList(Station);

        return page;
    }

    //时段内数据查询
    public List<StationTobrows>  findSingleMonitoringStationsnei(StationQueryInfo queryInfo){
        //只根据起止时间和基准站、监测站查询
        queryInfo.setModel("-1");
        List<StationTobrows> stationList = stationQueryDao.findSingleMonitorStations(queryInfo);
        //对结果处理
        checkStationList(stationList);

        if(stationList.size()>0){
            StationTobrows sti = stationList.get(0);

            for (int i = 0; i < stationList.size(); i++) {
                StationTobrows st = stationList.get(i);
                DecimalFormat df = new DecimalFormat("#.0"); // #.0保留以为小数 一次类推
                //只修改这3个参数
                st.setSKxAccChange(Double.parseDouble(df.format(st.getsKxAccChange()- sti.getsKxAccChange())));
                st.setSKyAccChange(Double.parseDouble(df.format(st.getsKyAccChange()- sti.getsKyAccChange())));
                st.setSDhAccChange(Double.parseDouble(df.format(st.getsDhAccChange()- sti.getsDhAccChange())));
            }
        }
        return stationList;
    }

    @Override
    public ArrayList<StationTobrows> find24timeSingleMonitoringStations(StationQueryInfo queryInfo) {

        //阈值
        String num2 = queryInfo.getThresholdUse();

        ArrayList<StationTobrows> StTobrows = find24timeSingleMonitoringStations22(queryInfo);

        ArrayList<StationTobrows> listdatadatytoo = new ArrayList<StationTobrows>();

        if(StTobrows != null){
            for (int i = 0; i < StTobrows.size(); i++) {
                DecimalFormat df = new DecimalFormat("0.0");
                if(i == 0){
                    StationTobrows o = StTobrows.get(i);
                    if(queryInfo.getX().equals("x") && queryInfo.getY().equals("y") && queryInfo.getH().equals("h")){
                        o.setSKxAccChange(0.0);
                        o.setSKyAccChange(0.0);
                        o.setSDhAccChange(0.0);
                        listdatadatytoo.add(o);
                    }
                    if(queryInfo.getX().endsWith("1")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getY().endsWith("2")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getX().endsWith("1")&&queryInfo.getY().endsWith("2")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2) && o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getX().endsWith("1")&&queryInfo.getH().endsWith("3")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2) &&  o.getsDhSingleChange()>Double.parseDouble(num2) || o.getsDhSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getY().endsWith("2")&&queryInfo.getH().endsWith("3")){
                        if(o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2) &&  o.getsDhSingleChange()>Double.parseDouble(num2) || o.getsDhSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getX().endsWith("1")&&queryInfo.getY().endsWith("2")&&queryInfo.getH().equals("3")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2) && o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2) && o.getsDhSingleChange()>Double.parseDouble(num2) || o.getsDhSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(0.0);
                            o.setSKyAccChange(0.0);
                            o.setSDhAccChange(0.0);
                            listdatadatytoo.add(o);
                        }
                    }

                }else{
                    StationTobrows o = StTobrows.get(i);
                    StationTobrows o2 = StTobrows.get(i-1);
                    if(queryInfo.getX().equals("x")&&queryInfo.getY().equals("y")&&queryInfo.getH().equals("h")){
                        o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                        o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                        o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                        listdatadatytoo.add(o);

                    }
                    if(queryInfo.getX().endsWith("1")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                            o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                            o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getY().endsWith("2")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                            o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                            o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getX().endsWith("1")&&queryInfo.getY().endsWith("2")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2) && o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                            o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                            o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                            listdatadatytoo.add(o);
                        }
                    }
                    if(queryInfo.getY().endsWith("2")&&queryInfo.getH().endsWith("3")){
                        if(o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2) &&  o.getsDhSingleChange()>Double.parseDouble(num2) || o.getsDhSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                            o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                            o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                            listdatadatytoo.add(o);
                        }
                    }

                    if(queryInfo.getX().endsWith("1")&&queryInfo.getY().endsWith("2")&&queryInfo.getH().equals("3")){
                        if(o.getsKxSingleChange()>Double.parseDouble(num2) || o.getsKxSingleChange()<Double.parseDouble("-"+num2) && o.getsKySingleChange()>Double.parseDouble(num2) || o.getsKySingleChange()<Double.parseDouble("-"+num2) && o.getsDhSingleChange()>Double.parseDouble(num2) || o.getsDhSingleChange()<Double.parseDouble("-"+num2)){
                            o.setSKxAccChange(Double.parseDouble(df.format(o.getDeltax()+o2.getsKxAccChange())));
                            o.setSKyAccChange(Double.parseDouble(df.format(o.getDeltay()+o2.getsKyAccChange())));
                            o.setSDhAccChange(Double.parseDouble(df.format(o.getDeltaz()+o2.getsDhAccChange())));
                            listdatadatytoo.add(o);
                        }
                    }
                }
            }
        }

        return listdatadatytoo;
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

    public ArrayList<StationTobrows> find24timeSingleMonitoringStations22(StationQueryInfo queryInfo){
        List<StationTobrows> s = stationQueryDao.findSingleMonitorStations(queryInfo);
        //对结果处理
        checkStationList(s);

        List<String> lists = new ArrayList<String>();
        ArrayList<StationTobrows> listdatadaty = new ArrayList<>();//计算好的数据
        //当数据大于等于3时计算
        if(s.size()>=3){
            //一次遍历
            for (int i = 0; i < s.size(); i++) {
                StationTobrows st = s.get(i);
                lists.add(st.getRecordTime().substring(0, 10));
            }

            //集合日期去重fu值
            Set<String> set = new HashSet<>();
            List<String> newList = new ArrayList<>();//去重后的所有日期集合
            for (Iterator<String> iter = lists.iterator(); iter.hasNext();) {
                String element = iter.next();
                if (set.add(element))
                    newList.add( element);
            }
            //数据迭代计算单期变形量的 X Y H 平均值
            for (String str : newList) {
                ArrayList<Object> listdata = new ArrayList<>();
                for (int i = 0; i < s.size(); i++) {
                    StationTobrows s1 = s.get(i);
                    if(s1.getRecordTime().substring(0, 10).equals(str)){
                        StationTobrows StationTobrows = new StationTobrows();
                        StationTobrows.setsKxSingleChange(s1.getsKxSingleChange());
                        StationTobrows.setsKySingleChange(s1.getsKySingleChange());
                        StationTobrows.setsDhSingleChange(s1.getsDhSingleChange());
                        StationTobrows.setRecordTime(s1.getRecordTime());
                        StationTobrows.setName(s1.getName());
                        listdata.add(StationTobrows);
                    }
                }

                double x = 0.0;
                double y = 0.0;
                double h = 0.0;
                String name = null;
                String datytime = null;
                int listlen =listdata.size();
                for (int e = 0; e < listdata.size(); e++) {
                    StationTobrows StationT = (StationTobrows)listdata.get(e);
                    x=x+StationT.getsKxSingleChange();
                    y=y+StationT.getsKySingleChange();
                    h=h+StationT.getsDhSingleChange();
                    name = StationT.getName();
                    datytime = StationT.getRecordTime();
                }
                DecimalFormat dt = new DecimalFormat("0.0");
                StationTobrows StationTobrowsdaty = new StationTobrows();
                StationTobrowsdaty.setName(name);
                StationTobrowsdaty.setRecordTime(datytime.substring(0, 10));
                String x1 =dt.format(x/listlen);
                if(x1.equals("-0.0")){
                    x1="0.0";
                }
                String y1 =dt.format(y/listlen);
                if(y1.equals("-0.0")){
                    y1="0.0";
                }
                String h1 =dt.format(h/listlen);
                if(h1.equals("-0.0")){
                    h1="0.0";
                }
                StationTobrowsdaty.setsKxSingleChange(Double.parseDouble(x1));
                StationTobrowsdaty.setsKySingleChange(Double.parseDouble(y1));
                StationTobrowsdaty.setsDhSingleChange(Double.parseDouble(h1));
                StationTobrowsdaty.setDeltax(x);//单期变形量总和
                StationTobrowsdaty.setDeltay(y);//单期变形量总和
                StationTobrowsdaty.setDeltaz(h);//单期变形量总和
                listdatadaty.add(StationTobrowsdaty);
            }
        }
        return listdatadaty;
    }
}
