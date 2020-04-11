package com.pdsk.controller;

import com.pdsk.util.Page;
import com.pdsk.service.BaselineManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@Controller
public class BaseLineManagementController {

    @Autowired
    private BaselineManagementService baselineManagementService;

    @RequestMapping("/baselineManagement")
    public String checkModel(@RequestParam("model") Integer model, String currPageNum){
        return "forward:/baselineManagement/" + model + "/" + currPageNum;
    }

    @RequestMapping("/baselineManagement/{model}/{page}")
    public String checkModelAndPage(Model mvcModel, @PathVariable("model") Integer model,@PathVariable("page") Integer pageNum){
        Page page = baselineManagementService.getBaselinePageByPageNum(pageNum);
        mvcModel.addAttribute("model",model);
        mvcModel.addAttribute("page",page);

        return "baselineManagement";
    }
}
