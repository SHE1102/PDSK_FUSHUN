package com.pdsk.controller;

import com.pdsk.domain.SiteQuery;
import com.pdsk.service.SiteInfoService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Created by Administrator on 2020/2/11 0011.
 */
//@SessionAttributes("pages")
@Controller
public class SiteInfoController {

    @Autowired
    private SiteInfoService siteInfoService;

    @RequestMapping("/siteInfo")
    public String checkModel(/*@RequestParam("model") */Integer model,String currPageNum){
        return "forward:/siteInfo/" + model + "/" + currPageNum;
    }

    @RequestMapping("/siteInfo/{model}/{page}")
    public String checkModelAndPage(Model mvcModel, @PathVariable("model") Integer model, @PathVariable("page") Integer pageNum){
        Page page = siteInfoService.getSiteInfoByPageNum(pageNum);

        mvcModel.addAttribute("model",model);
        mvcModel.addAttribute("pages",page);

        return "siteInfo";
    }

    @RequestMapping(value = "/insertSite",method = RequestMethod.POST)
    public String insertSite(Model model,Integer lastPageNum,SiteQuery siteQuery){
        /*System.out.println("====================");
        System.out.println(siteQuery.getName() + ":" + siteQuery.getOriginalsDx() + ":" + siteQuery.getOriginalsDy() + ":" +
                siteQuery.getOriginalsKx() + ":" + siteQuery.getOriginalsKy() + ":" + siteQuery.getOriginalsDh() + ":" + siteQuery.getMid());
        System.out.println(lastPageNum);
        System.out.println("====================");*/

        boolean result = siteInfoService.insertSite(siteQuery);

        String msg = result ? "添加成功" : "添加失败";
        model.addAttribute("msg",msg);

        return "forward:/siteInfo/2/" + lastPageNum;
    }

    @RequestMapping(value = "/updateSite",method = RequestMethod.POST)
    public String updateSite(Model model,Integer currPageNum,SiteQuery siteQuery){
        boolean result = siteInfoService.updateSite(siteQuery);

        String msg = result ? "更新成功" : "更新失败";
        model.addAttribute("msg",msg);

        return "forward:/siteInfo/2/" + currPageNum;
    }

    @RequestMapping(value = "/deleteSite/{id}/{currPageNum}",method = RequestMethod.GET)
    public String deleteSite(@PathVariable("id") String id,@PathVariable("currPageNum") Integer currPageNum,Model model){
        boolean result = siteInfoService.deleteSiteById(id);

        String msg = result ? "删除成功" : "删除失败";
        model.addAttribute("msg",msg);

        return "forward:/siteInfo/2/" + currPageNum;
    }
}
