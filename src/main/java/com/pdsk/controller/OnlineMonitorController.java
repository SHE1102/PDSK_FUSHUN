package com.pdsk.controller;

import com.pdsk.domain.*;
import com.pdsk.service.ContentEditorService;
import com.pdsk.service.OnlineMonitorService;
import com.pdsk.service.SiteInfoService;
import com.pdsk.service.impl.ContentEditorServiceImpl;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class OnlineMonitorController {

    @Autowired
    private OnlineMonitorService onlineMonitorService;

    @Autowired
    private ContentEditorService contentEditorService;

    @Autowired
    private SiteInfoService siteInfoService;

    @RequestMapping("/onlineMonitor")
    public String monitor(Model model){

        Time ti = onlineMonitorService.findTime();

        int t = ti.getTime();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd ");

        Date date = new Date();
        String time = format.format(date);
        String time1 = time + "00:00:00";// 在线更新一天中新时间

        int hours = date.getHours();
        System.out.println(hours+"hours");
        //int hours1;
        String hour = null;
        String string = null;// 在线更新最新时间

        // formatmail = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        //String timemail = formatmail.format(date);

        if (t == 1) {// 1小时
            //System.out.println("1");
            if (hours >= 1 && hours < 10) {
                String s = String.valueOf(hours);
                string = time + "" + "0" + s + "::00";
                //System.out.println(string);
            } else {
                String s = String.valueOf(hours);
                string = time + "" + s + ":59:00";
                //System.out.println(string);
            }
        } else if (t == 2) { // 2小时
            //System.out.println("2");
            if (hours % t == 0) {
                if (hours >= 1 && hours < 10) {
                    String s = String.valueOf(hours);
                    string = time + "" + "0" + s + ":59:00";
                } else {
                    String s = String.valueOf(hours);
                    string = time + "" + s + ":59:00";
                    //System.out.println(string + "上午");
                }

            } else if (hours % t == 1) {
                hours = hours - 1;
                if (hours >= 1 && hours < 10) {
                    String s = String.valueOf(hours);
                    string = time + "" + "0" + s + ":59:00";
                    //System.out.println(string);
                } else {
                    String s = String.valueOf(hours);
                    string = time + "" + s + ":59:00";
                    //System.out.println(string + "下午");
                }
            } else if (hours == 1) {
                string = time + "" + "00" + ":59:00";

            } else if (hours == 00) {
                //String s = String.valueOf(hours);
                string = time + "" + hour + ":59:00";
            }
        } else if (t == 4) {// 4小时
            //System.out.println("4");
            //System.out.println(hours + "hours");
            if (hours >= 8 && hours < 12) {
                string = time + "" + "08" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 12 && hours < 16) {

                string = time + "" + "12" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 16 && hours < 20) {

                string = time + "" + "16" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 20 && hours < 23) {

                string = time + "" + "20" + ":59:00";
            } else if (hours >= 0 && hours < 04) {

                string = time + "" + "00" + ":59:00";
            } else if (hours >= 4 && hours < 8) {

                string = time + "" + "04" + ":59:00";
            }
        } else if (t == 6) {// 6小时
            //System.out.println("6");
            if (hours >= 2 && hours < 8) {
                string = time + "" + "02" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 8 && hours < 14) {
                string = time + "" + "08" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 14 && hours < 20) {
                string = time + "" + "20" + ":59:00";
                //System.out.println(string);
            } else if (hours >= 20 && hours < 2) {
                string = time + "" + "20" + ":59:00";
                //System.out.println(string);
            }
        } else if (t == 8) {// 8小时
            //System.out.println("8");
            if (hours >= 8 && hours < 16) {
                string = time + "" + "08" + ":59:00";
            } else if (hours >= 16 && hours < 0) {

                string = time + "" + "16" + ":59:00";
            } else if (hours >= 0 && hours < 8) {
                string = time + "" + "00" + ":59:00";
            }
        } else if (t == 12) {// 12小时
            //System.out.println("12");
            if (hours >= 8 && hours < 20) {
                string = time + "" + "08" + ":59:00";
            } else if (hours >= 20 && hours < 8) {
                string = time + "" + "20" + ":59:00";
            }

        } else if (t == 24) {// 24小时
            string = time + "" + "23" + ":59:59";
        }
        //说明信息
        Txt txt = contentEditorService.findTxtRecord();

        //流动站
        List<SiteQuery> siteQuerylist = siteInfoService.findSiteNameList();

        // 结果返回
        Page page = siteInfoService.getSiteInfoByPageNum(1);
        List<SiteQuery> siteQuery = page.getSiteInfoList();
        List<StationTobrows> ssss= new ArrayList<StationTobrows>();

        List<BaseStation> MSment = siteInfoService.findAllBaseStation();// 所有基础站查询
        for(int RU= 0; RU < MSment.size();RU++){
            List<StationTobrows> StationTobrowslist1 = onlineMonitorService.findStationTobrows(time1, string,MSment.get(RU).getName());// 图形数据结果 抚顺版
            if(StationTobrowslist1.size()>0){
                for(int R= 0; R < siteQuery.size();R++){
                    for (int i = 0; i < StationTobrowslist1.size(); i++) {
                        String name1 = siteQuery.get(R).getName();
                        String name2 = StationTobrowslist1.get(i).getName();
                        if(name1.equals(name2)){
                            StationTobrows  fu = StationTobrowslist1.get(i);
                            fu.setName(MSment.get(RU).getName()+"-"+StationTobrowslist1.get(i).getName());
                            ssss.add(fu);
                        }
                    }
                }
            }
        }

        // 封装图形对象数据
        ArrayList al = new ArrayList();
        ArrayList al1 = new ArrayList();
        ArrayList al2 = new ArrayList();
        List list = new ArrayList();
			/*-----------------勿动--------------------*/
        ArrayList<Object> Listname = null;
        ArrayList<Object> Listx = null;
        ArrayList<Object> Listy = null;
        ArrayList<Object> Listz = null;
        ArrayList<Object> ListN = null;
        ArrayList<Object> ListY = new ArrayList<Object>();
        for (int i = 0; i < siteQuerylist.size(); i++) {
            String name =siteQuerylist.get(i).getName();
            Listname = new ArrayList<Object>();
            Listx = new ArrayList<Object>();
            Listy = new ArrayList<Object>();
            Listz = new ArrayList<Object>();
            ListN = new ArrayList<Object>();
            for (int e = 0; e < ssss.size(); e++) {
                String STbname = ssss.get(e).getName();
                StationTobrows STb = ssss.get(e);
                if(name.equals(STbname)){
                    //Listname.add("'" + STb.getName() +" " + STb.getRecordTime().substring(11, 13) +"'");
                    if( Listname.size()== 0){
                        Listname.add("'" + STb.getName() +"'");
                    }
                    Listx.add(STb.getsKxSingleChange());
                    Listy.add(STb.getsKySingleChange());
                    Listz.add(STb.getsDhSingleChange());
                }
            }
            ListN.add(Listname);
            ListN.add(Listx);
            ListN.add(Listy);
            ListN.add(Listz);
            ListY.add(ListN);
        }

        for (int i = 0; i < ssss.size(); i++) {
            StationTobrows STb = ssss.get(i);
            list.add("'" + STb.getName() +
                    " " + STb.getRecordTime().substring(11, 13) +
                    "'");

            //list.add("'"+STb.getName()+"'");
            al.add(STb.getsKxSingleChange());
            al1.add(STb.getsKySingleChange());
            al2.add(STb.getsDhSingleChange());

        }

        model.addAttribute("t",t);
        model.addAttribute("StationTobrows2",ssss);
        model.addAttribute("al",al);
        model.addAttribute("al1",al1);
        model.addAttribute("al2",al2);
        model.addAttribute("list",list);
        model.addAttribute("txt",txt);

        return "onlineMonitor";
    }
}
