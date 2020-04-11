package com.pdsk.controller;

import com.pdsk.domain.User;
import com.pdsk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;

/**
 * Created by Administrator on 2020/2/25 0025.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/loginPage")
    public String index(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(ModelMap modelMap, String username, String password) throws SQLException {

        if("".equals(username) || "".equals(password)){
            modelMap.addAttribute("loginMsg","用户名或密码不能为空！");
            return "login";
        }
        //System.out.println("========="+username + ":" + password);

        User user = userService.findUserByUsernameAndPassword(username,password);

        if (user != null){
            modelMap.addAttribute("users",user);
            return "home";
        }
        else {
            modelMap.addAttribute("loginMsg","用户名或密码错误！");
            return "login";
        }
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user,Model model){
        int count = userService.findUserByName(user.getName());

        if(count > 0){
            model.addAttribute("registerMsg","用户已存在");
        } else {
            boolean result = userService.insertUser(user);
            if(result){
                model.addAttribute("registerMsg","注册成功，请重新登录");
            } else {
                model.addAttribute("registerMsg","注册失败");
            }
        }

        return "login";
    }
}
