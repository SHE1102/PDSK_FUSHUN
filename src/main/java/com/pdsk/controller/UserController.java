package com.pdsk.controller;

import com.pdsk.domain.User;
import com.pdsk.service.UserService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.sql.SQLException;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@SessionAttributes({"user","tp"})
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/usersManagement")
    public String checkByForm(String currPageNum){
        return "forward:/usersManagement/" + currPageNum;
    }

    @RequestMapping("/usersManagement/{page}")
    public String checkByMenu(Model model, @PathVariable("page") int pageNum){
        Page page = userService.getUserPageByPageNum(pageNum);

        model.addAttribute("page",page);
        return "usersManagement";
    }

    @RequestMapping("/usersManagement/insertUser")
    public String insertUser(Model model,User user,Integer lastPageNum){
       /* System.out.println("===================");
        System.out.println(user.getId() + ":" + user.getName() + ":" + user.getPassword() + ":" + user.getRealname() + ":" +
        user.getPhone() + ":" + user.getMail() + ":" + user.getPermissions() + ":" + user.getStatus());
        System.out.println(lastPageNum);
        System.out.println("===================");*/
       int count = userService.findUserByName(user.getName());

       String msg;
       if(count <= 0){
           boolean result = userService.insertUser(user);
           msg = result ? "添加用户成功" : "添加用户失败";
       } else {
           msg = "用户名已存在";
       }
       model.addAttribute("msg",msg);

       return "forward:/usersManagement/" + lastPageNum;
    }
    @RequestMapping("/usersManagement/updateUser")
    public String updateUser(Model model,User user,Integer currPageNum){
        int count = userService.findUserByName(user.getName());

        String msg;
        if(count <= 0){
            boolean result = userService.updateUser(user);
            msg = result ? "修改用户成功" : "修改用户失败";
        } else {
            msg = "用户名已存在";
        }

        model.addAttribute("msg",msg);

        return "forward:/usersManagement/" + currPageNum;
    }

    @RequestMapping("/usersManagement/deleteUser/{id}/{currPageNum}")
    public String deleteUser(Model model,@PathVariable("id") String id,@PathVariable("currPageNum") Integer currPageNum){
        boolean result = userService.deleteUser(id);

        String msg = result ? "删除用户成功" : "删除用户失败";
        model.addAttribute("msg",msg);

        return "forward:/usersManagement/" + currPageNum;
    }

}
