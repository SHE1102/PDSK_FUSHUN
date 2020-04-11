package com.pdsk.controller;

import com.pdsk.service.ContentEditorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@Controller
public class SummaryController {

    @Autowired
    private ContentEditorService contentEditorService;
    @RequestMapping("/summary")
    public String ss(Model model){

        String txt = contentEditorService.findTxtRecord().getTxt();
        model.addAttribute("txt",txt);

        return "danci";
    }
}
