package com.pdsk.controller;

import com.pdsk.domain.*;
import com.pdsk.service.SiteInfoService;
import com.pdsk.service.TrendAnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class TrendAnalysisController {

    @Autowired
    private SiteInfoService siteInfoService;

    @Autowired
    private TrendAnalysisService trendAnalysisService;

    @RequestMapping("/trendAnalysis/{queryModel}")
    public String ss(@PathVariable("queryModel") String  queryModel, Model model){

        StationQueryInfo queryInfo = new StationQueryInfo();

        //获取基准站和监测站列表
        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        if(queryModel.equals("4")){
            model.addAttribute("baseStationList", baseStationList);//抚顺版
            model.addAttribute("monitorStationList", monitorStationList);
            model.addAttribute("queryInfo", queryInfo);
        }

        return "trendAnalysis";
    }

    @RequestMapping("/trendAnalysis")
    public String ss(Model model,StationQueryInfo queryInfo){

        ArrayList<Object> listx =  new ArrayList<>();
        ArrayList<Object> listy =  new ArrayList<>();
        ArrayList<Object> listh =  new ArrayList<>();
        ArrayList<Object> listdate =  new ArrayList<>();

        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();
        model.addAttribute("baseStationList", baseStationList);//抚顺版
        model.addAttribute("monitorStationList", monitorStationList);

        model.addAttribute("queryInfo", queryInfo);

        List<StationTobrows> stationList = trendAnalysisService.trendAnalysisGet(queryInfo);
		//List<StationTobrows> StationTobrowslist = TrendanalysisServert.Trendanalysisget(t1, t2, name1,Double.parseDouble(Q), Double.parseDouble(R));//标准版

        for (int i = 0; i < stationList.size(); i++) {
            StationTobrows station = stationList.get(i);
            listx.add(station.getsKxAccChange());
            listy.add(station.getsKyAccChange());
            listh.add(station.getsDhAccChange());
            listdate.add("'"+station.getRecordTime()+"'");
        }

        model.addAttribute("x", listx);
        model.addAttribute("y", listy);
        model.addAttribute("h", listh);
        model.addAttribute("datae", listdate);

        model.addAttribute("name", queryInfo.getMonitorStationName() + "累计变形量趋势图");

        return "trendAnalysis";
    }
}
