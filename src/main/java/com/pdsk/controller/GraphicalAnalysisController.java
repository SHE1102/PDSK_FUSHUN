package com.pdsk.controller;

import com.pdsk.domain.BaseStation;
import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationQueryInfo;
import com.pdsk.domain.StationTobrows;
import com.pdsk.service.SiteInfoService;
import com.pdsk.service.StationQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class GraphicalAnalysisController {

    @Autowired
    private SiteInfoService siteInfoService;

    @Autowired
    private StationQueryService stationQueryService;

    @RequestMapping("/graphicalAnalysis/{pageModel}")
    public String check0(Model model, @PathVariable("pageModel") String pageModel){

        StationQueryInfo queryInfo = new StationQueryInfo();
        queryInfo.setPageModel(pageModel);

        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        model.addAttribute("baseStationList", baseStationList);//抚顺版
        model.addAttribute("monitorStationList", monitorStationList);
        model.addAttribute("queryInfo", queryInfo);

        return "graphicalAnalysis";
    }

    @RequestMapping("/graphicalAnalysis")
    public String check(Model model,StationQueryInfo queryInfo){

        System.out.println("==========================");
        System.out.println(queryInfo.getPageModel() + ":" + queryInfo.getModel() + ":" + queryInfo.getDateModel() + ":" +
        queryInfo.getTimeStart() + ":" + queryInfo.getTimeEnd() + ":" + queryInfo.getBaseStationName() + ":" + queryInfo.getMonitorStationName()+":" +
        queryInfo.getX() + ":" + queryInfo.getY() + ":" + queryInfo.getH());
        System.out.println("==========================");

        List<BaseStation> baseStationList = siteInfoService.findAllBaseStation();// 所有基础站查询
        List<SiteQuery> monitorStationList = siteInfoService.findSiteNameList();

        model.addAttribute("baseStationList", baseStationList);//抚顺版
        model.addAttribute("monitorStationList", monitorStationList);
        model.addAttribute("queryInfo", queryInfo);

        //////////////////////////
		//单点多方向
        if("1".equals(queryInfo.getPageModel())){
            ArrayList<Object> al = new ArrayList<>();// 单计变形
            ArrayList<Object> al1 = new ArrayList<>();// 单计变形dy
            ArrayList<Object> al2 = new ArrayList<>();// 单计变形dz

            ArrayList<Object> lal = new ArrayList<>();// 累计变形
            ArrayList<Object> lal1 = new ArrayList<>();// 累计变形dy
            ArrayList<Object> lal2 = new ArrayList<>();// 累计变形dz

            ArrayList<Object> time = new ArrayList<>();// 轴时间加站点

            long s3=0;
            if(queryInfo.getTimeStart() !=null){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

                try {
                    long s1 = sdf.parse(queryInfo.getTimeStart()).getTime();
                    long s2 = sdf.parse(queryInfo.getTimeEnd()).getTime();
                    s3 = s2-s1;
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            //List<StationTobrows> stationList = stationQueryService.findSingleReportbx(t1, t3,Basestationname, num);//抚顺版
            List<StationTobrows> stationList = stationQueryService.findSingleReportbx(queryInfo);//抚顺版
            for (int i = 0; i < stationList.size(); i++) {
                StationTobrows station = stationList.get(i);
                //time.add("'" + STs.getName() + " " + STs.getRecordTime() + "'");

                if(s3<777599000){
                    time.add("'" + station.getRecordTime() + "'");
                }else{
                    time.add("'" + station.getRecordTime().substring(0,11) + "'");
                }

                al.add(station.getsKxSingleChange());
                al1.add(station.getsKySingleChange());
                al2.add(station.getsDhSingleChange());

                lal.add(station.getsKxAccChange());
                lal1.add(station.getsKyAccChange());
                lal2.add(station.getsDhAccChange());
            }

            if("1".equals(queryInfo.getModel())){
                model.addAttribute("als1", al);// 单期变形动态数据模型
                model.addAttribute("als2", al1);
                model.addAttribute("als3", al2);
                if(queryInfo.getMonitorStationName() != null){
                    //session.setAttribute("nameLD", num+"多方向单期变形量");//标准版
                    model.addAttribute("nameLD", queryInfo.getBaseStationName()+"-"+queryInfo.getMonitorStationName()+"多方向单期变形量");//抚顺版
                }

            }else{
                model.addAttribute("als1", lal);
                model.addAttribute("als2", lal1);
                model.addAttribute("als3", lal2);
                if(queryInfo.getMonitorStationName() != null){
                    //session.setAttribute("nameLD", num+"多方向累计变形量");//标准版
                    model.addAttribute("nameLD", queryInfo.getBaseStationName()+"-"+queryInfo.getMonitorStationName()+"多方向累计变形量");//抚顺版
                }
            }
            model.addAttribute("timesg", time);
        }


		//多点单方向
        if("2".equals(queryInfo.getPageModel())){
            ArrayList<Object> timesG =null;// 轴时间加站点
            ArrayList<Object> alsG = null;//
            ArrayList<Object> al1sG = null;//
            ArrayList<Object> al2sG = null;//
            ArrayList<Object> al3sG = null;//
            List<Object> G = new ArrayList<>();
            List<Object> list = new ArrayList<>();

            for (int i = 0; i < monitorStationList.size(); i++) {
                String name = monitorStationList.get(i).getName();
                queryInfo.setMonitorStationName(name);
                list.add("'"+name+"'");
                List<StationTobrows> stationList = stationQueryService.findSingleReportbx(queryInfo);//OnLineMonitoringservice.findSingleReportbx(t1, t3,Basestationname,name );//抚顺版
                //List<StationTobrows> STSSG = OnLineMonitoringservice.findSingleReportbx(t1, t3,name );//标准版
                timesG = new ArrayList<>();
                alsG = new ArrayList<>();
                al1sG = new ArrayList<>();
                al2sG = new ArrayList<>();
                if(i==0){
                    al3sG = new ArrayList<>();
                }
                for (int J = 0; J < stationList.size(); J++) {
                    StationTobrows STsG = stationList.get(J);
                    if(J == 0){
                        timesG.add('"' + STsG.getName()+ '"');
                    }
                    if(queryInfo.getX() != null){
                        if("x".equals(queryInfo.getX())){
                            if("1".equals(queryInfo.getModel())){
                                alsG.add(STsG.getsKxSingleChange());
                                model.addAttribute("nameLJB", "x方向多站单期变形量");
                            }else {
                                alsG.add(STsG.getsKxAccChange());
                                model.addAttribute("nameLJB", "x方向多站累计变形量");
                            }

                        }
                    }
                    if(queryInfo.getY() !=null){
                        if("y".equals(queryInfo.getY())){
                            if("1".equals(queryInfo.getModel())){
                                al1sG.add(STsG.getsKySingleChange());
                                model.addAttribute("nameLJB", "y方向多站单期变形量");
                            }else {
                                al1sG.add(STsG.getsKyAccChange());
                                model.addAttribute("nameLJB", "y方向多站累计变形量");
                            }

                        }
                    }
                    if(queryInfo.getH() !=null){
                        if("h".equals(queryInfo.getH())){
                            if("1".equals(queryInfo.getModel())){
                                al2sG.add(STsG.getsDhSingleChange());
                                model.addAttribute("nameLJB", "h方向多站单期变形量");
                            }else {
                                al2sG.add(STsG.getsDhAccChange());
                                model.addAttribute("nameLJB", "h方向多站累计变形量");
                            }

                        }
                    }
                    if(i == 0){
                        long s3=0;
                        if(queryInfo.getTimeStart() !=null){
                            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

                            try {
                                long s1 = sd.parse(queryInfo.getTimeStart()).getTime();
                                long s2 = sd.parse(queryInfo.getTimeEnd()).getTime();
                                s3 = s2-s1;
                            } catch (ParseException e) {
                                e.printStackTrace();
                            }
                        }
                        if(s3<777599000){
                            al3sG.add("'"+STsG.getRecordTime()+"'");//时间轴

                        }else{
                            al3sG.add("'"+STsG.getRecordTime().substring(0,11)+"'");//时间轴
                        }
                    }
                }
                List<Object> listSG1 = new ArrayList<>();
                listSG1.add(timesG);
                if(queryInfo.getX() !=null){
                    if("x".equals(queryInfo.getX())){
                        listSG1.add(alsG);
                    }
                }
                if(queryInfo.getY() !=null){
                    if("y".equals(queryInfo.getY())){
                        listSG1.add(al1sG);
                    }
                }
                if(queryInfo.getH() !=null){
                    if("h".equals(queryInfo.getH())){
                        listSG1.add(al2sG);
                    }
                }
                G.add(listSG1);
            }

            if(queryInfo.getX() != null || queryInfo.getY() != null || queryInfo.getH() !=null ){
                model.addAttribute("Gsg", G);//多点方形数据
            }else{
                model.addAttribute("Gsg", "[[]]");
            }

            model.addAttribute("al3sG", al3sG);
            model.addAttribute("listname", list);
        }

        return "graphicalAnalysis";
    }
}
