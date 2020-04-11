package com.pdsk.controller;

import com.pdsk.domain.BaseStation;
import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationQueryInfo;
import com.pdsk.service.SiteInfoService;
import com.pdsk.service.StationQueryService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class StationQueryController {

    @Autowired
    private SiteInfoService siteInfoService;

    @Autowired
    private StationQueryService stationQueryService;

    @RequestMapping("/stationQuery/{queryModel}")
    public String checkByModel(Model model, @PathVariable("queryModel") String queryModel){
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();
        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询

        if(queryModel.equals("4")){
            //站点获取
            model.addAttribute("baseStationList", baseStationList);//抚顺版(所有流动站)
            model.addAttribute("monitorStationList", monitorStationList);
        }

        return "stationQuery";
    }

    //分页查询
    //参数说明：查询模式 -- 阈值 -- X -- Y -- H -- 日期模式 -- 起始时间 -- 终止时间 -- 基准站 -- 监测站 -- 当前页面
    @RequestMapping(value = "/stationQuery/{currPageNum}/{queryModel}/{threshold}/{X}/{Y}/{H}/{dateModel}/{timeStart}/{timeEnd}/{baseStationName}/{monitorStationName}", method = RequestMethod.GET)
    public String checkByPage(RedirectAttributes ra, @PathVariable("currPageNum") String currPageNum, @PathVariable("queryModel") String queryModel,
                              @PathVariable("threshold") String threshold, @PathVariable("X") String X, @PathVariable("Y") String Y,
                              @PathVariable("H") String H, @PathVariable("dateModel") String dateModel, @PathVariable("timeStart") String timeStart,
                              @PathVariable("timeEnd") String timeEnd, @PathVariable("baseStationName") String baseStationName,
                              @PathVariable("monitorStationName") String monitorStationName){

        StationQueryInfo queryInfo = new StationQueryInfo(queryModel,threshold,X,Y,H,
                dateModel,timeStart,timeEnd,baseStationName,monitorStationName,currPageNum);

        ra.addFlashAttribute("queryInfo",queryInfo);
        return "redirect:/stationQueryForward";
    }

    //监测站查询
    @RequestMapping(value = "/stationQuery", method = RequestMethod.GET)
    public String checkByStation(RedirectAttributes model,StationQueryInfo queryInfo){
        model.addFlashAttribute("queryInfo",queryInfo);
        return "redirect:/stationQueryForward";
    }

    @RequestMapping(value = "/stationQueryForward", method = RequestMethod.GET)
    public String check(Model model,@ModelAttribute("queryInfo") StationQueryInfo queryInfo){

       /* System.out.println("===================");
        System.out.println(queryInfo.getModel() + ":" + queryInfo.getThreshold() + ":" + queryInfo.getX() + ":" + queryInfo.getY() + ":"
                + queryInfo.getH() + ":" + queryInfo.getDateModel() + ":" + queryInfo.getTimeStart() + ":" +queryInfo.getTimeEnd() + ":"
                +queryInfo.getBaseStationName()+":" + queryInfo.getMonitorStationName()+ ":" +queryInfo.getCurrPageNum());
        System.out.println("===================");*/

        //获取基准站和监测站列表
        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        Page page = stationQueryService.findPageByQueryInfo(queryInfo);

        model.addAttribute("baseStationList", baseStationList);
        model.addAttribute("monitorStationList", monitorStationList);
        model.addAttribute("page", page);
        model.addAttribute("queryInfo",queryInfo);

        return "stationQuery";
    }


}
