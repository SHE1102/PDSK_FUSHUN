package com.pdsk.controller;

import com.pdsk.domain.Txt;
import com.pdsk.service.ContentEditorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Controller
public class ContentEditorController {

    @Autowired
    private ContentEditorService contentEditorService;

    @RequestMapping("/contentEditor")
    public String contentManagement(String content,String instructions,String id,Model model){

        //System.out.println("===================" + content + ":" + instructions + ":" + id);
        int count = contentEditorService.getRecordCount();

        if(count > 0 && content != null){
            contentEditorService.updateTxtById(id,content);
        }
        if(count > 0 && instructions != null){
            contentEditorService.updateInstructionsById(id,instructions);
        }

        Txt txt = contentEditorService.findTxtRecord();

        if(count <= 0){
            if(content != null){
                contentEditorService.insertTxt(content);
            }
            if(instructions != null){
                contentEditorService.insertInstructions(instructions);
            }
        }
        model.addAttribute("txt",txt);
        return "contentEditor";
    }
    /*@RequestMapping("/contentEditor")
    public String ss(String content,String instructions,String id,Model model){

        int count = contentEditorService.getRecordCount();

        if(count > 0 && content != null){
            contentEditorService.updateTxtById(id,content);
        }
        if(count > 0 && instructions != null){
            contentEditorService.updateInstructionsById(id,instructions);
        }

        Txt txt = contentEditorService.findTxtRecord();

        if(count <= 0){
            if(content != null){
                contentEditorService.insertTxt(content);
            }
            if(instructions != null){
                contentEditorService.insertInstructions(instructions);
            }
        }
        model.addAttribute("txt",txt);
        return "contentEditor";
    }*/
}
