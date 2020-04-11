package com.pdsk.controller;

import com.pdsk.domain.Email;
import com.pdsk.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
@Controller
public class AlarmController {

    @Autowired
    private EmailService emailService;

    @RequestMapping("/alarmManagement")
    public String checkAlarm(Model model){
        Email email = emailService.findEmail();

        model.addAttribute("email",email);

        return "alarmManagement";
    }

    @RequestMapping("/alarmManagement/update")
    public String updateAlarm(Model model,Email email){
        Email emailObj = emailService.findEmail();

        String msg;
        boolean result;

        if (emailObj == null){
            result = emailService.insertEmail(email);
            msg = result ? "信息添加成功" : "信息添加失败";
        } else {
            result = emailService.updateEmail(email);
            msg = result ? "信息修改成功" : "信息修改失败";
        }

        model.addAttribute("email",email);
        model.addAttribute("msg",msg);

        return "alarmManagement";
    }
}
