package com.pdsk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.sql.SQLException;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
@ControllerAdvice
//@ResponseBody
public class ExceptionHandle {

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(Exception.class)
    public String ss(Exception e,Model model){
        model.addAttribute("ex",e.getMessage());
        model.addAttribute("message","或数据库表不存在或表字段错误或数据库不存在");
        return "error";
    }
}
