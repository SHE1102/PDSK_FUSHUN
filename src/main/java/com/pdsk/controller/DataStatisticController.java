package com.pdsk.controller;

import com.pdsk.domain.*;
import com.pdsk.service.SiteInfoService;
import com.pdsk.service.StationQueryService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class DataStatisticController {

    @Autowired
    private SiteInfoService siteInfoService;

    @Autowired
    private StationQueryService stationQueryService;

    @RequestMapping("/dataStatistic/{pageModel}/{queryModel}")
    public String ss(Model model, @PathVariable("pageModel") String pageModel, @PathVariable("queryModel") String queryModel){
        StationQueryInfo queryInfo = new StationQueryInfo();
        queryInfo.setPageModel(pageModel);
        queryInfo.setModel(queryModel);

        //获取基准站和监测站列表
        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        if(queryModel.equals("4")){
            model.addAttribute("baseStationList", baseStationList);//抚顺版
            model.addAttribute("monitorStationList", monitorStationList);
            model.addAttribute("queryInfo", queryInfo);
        }

        return "dataStatistic";
    }

    //站点查询--跳转
    @RequestMapping("/dataStatistic/{pageModel}")
    public String ss1(@PathVariable("pageModel") String pageModel,RedirectAttributes ra,StationQueryInfo queryInfo){
        queryInfo.setPageModel(pageModel);
        ra.addFlashAttribute("queryInfo",queryInfo);

        return "redirect:/dataStatistic";
    }

    //分页
    //参数说明：页面模式-查询模式-阈值-X-Y-H-日期模式-起始时间-终止时间-基准站-监测站-当前页面
    @RequestMapping("/dataStatistic/{pageModel}/{currPageNum}/{queryModel}/{threshold}/{X}/{Y}/{H}/{dateModel}/{timeStart}/{timeEnd}/{baseStationName}/{monitorStationNamee}")
    public String ssss(RedirectAttributes ra,@PathVariable("pageModel") String pageModel,@PathVariable("currPageNum") String currPageNum,@PathVariable("queryModel") String queryModel,
                       @PathVariable("threshold") String threshold, @PathVariable("X") String X, @PathVariable("Y") String Y,@PathVariable("H") String H,
                       @PathVariable("dateModel") String dateModel,@PathVariable("timeStart") String timeStart, @PathVariable("timeEnd") String timeEnd,
                       @PathVariable("baseStationName") String baseStationName,@PathVariable("monitorStationNamee") String monitorStationNamee
                       ){
        StationQueryInfo queryInfo = new StationQueryInfo(queryModel,threshold,X,Y,H,dateModel,timeStart,timeEnd,baseStationName,monitorStationNamee,currPageNum);
        queryInfo.setPageModel(pageModel);

        ra.addFlashAttribute("queryInfo",queryInfo);
        return "redirect:/dataStatistic";
    }

    @RequestMapping("/dataStatistic")
    public String ss2(Model model, @ModelAttribute("queryInfo") StationQueryInfo queryInfo){

        queryInfo.setModel("3");//累计变形量控制点

        /*System.out.println("=======================");
        System.out.println(queryInfo.getPageModel() + ":" + queryInfo.getModel() + ":" + queryInfo.getThreshold() + ":" + queryInfo.getX() + ":" + queryInfo.getY() +
                ":" + queryInfo.getH() + ":" +  queryInfo.getDateModel()+ ":" +queryInfo.getTimeStart() + ":" +queryInfo.getTimeEnd() + ":" +queryInfo.getBaseStationName()
                + ":" +queryInfo.getMonitorStationName() + ":" + queryInfo.getCurrPageNum());
        System.out.println("=======================");*/

        stationQueryService.checkQueryInfo(queryInfo);

        //////////////////////111111111111
        //获取基准站和监测站列表
        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        model.addAttribute("baseStationList", baseStationList);//抚顺版
        model.addAttribute("monitorStationList", monitorStationList);

        if("1".equals(queryInfo.getPageModel())){
            Page page = null;
            if(queryInfo.getTimeStart() != null){
                //PageLIst = stationQueryService.findPageListByQueryInfo(t1, t3,name1, MSmentonename,Integer.parseInt(currPageNO),Double.parseDouble(num2),X,Y,H);
                page = stationQueryService.findPageListByQueryInfo(queryInfo);
            }
            model.addAttribute("page", page);
        }

        /*
        /////////////////////变量未使用
        Page pages = stationQueryService.findPageByQueryInfo(queryInfo);
        List<StationTobrows> StationTobrows = pages.getStationList();
        if(StationTobrows.size()!=0){
            StationTobrows  StationTobrowsLj = StationTobrows.get(0);
            model.addAttribute("StationTobrowsLj", StationTobrowsLj);//累计变形量单点
        }*/

        //24小时统计功能
        if("2".equals(queryInfo.getPageModel())){
            ArrayList<StationTobrows> listdatadatytoo = stationQueryService.find24timeSingleMonitoringStations(queryInfo);
            model.addAttribute("listdatadatytoo", listdatadatytoo);
        }

        model.addAttribute("queryInfo", queryInfo);

        return "dataStatistic";
    }
}
