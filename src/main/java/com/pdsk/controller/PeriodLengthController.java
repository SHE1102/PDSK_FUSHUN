package com.pdsk.controller;

import com.pdsk.domain.TIMEs;
import com.pdsk.service.PeriodLengthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2020/2/12 0012.
 */

@Controller
public class PeriodLengthController {

    @Autowired
    private PeriodLengthService periodLengthService;

    @RequestMapping(value="/periodLength/{model}",method = RequestMethod.GET)
    public String ss(@PathVariable("model") Integer model,Model mvcModel){
        TIMEs times = periodLengthService.findTime();
        mvcModel.addAttribute("time",times);
        mvcModel.addAttribute("model",model);
        return "periodLength";
    }

    @RequestMapping(value="/periodLength",method = RequestMethod.POST)
    public String ss1(Model mvcModel,@RequestParam("model") Integer model,Integer id,String time){
        TIMEs times = new TIMEs(id,time);
        boolean result = periodLengthService.updateTime(times);
        String msg = result ? "更新成功" : "更新失败";
        mvcModel.addAttribute("msg",msg);
        mvcModel.addAttribute("model",model);
        mvcModel.addAttribute("time",times);
        return "periodLength";
    }


}
