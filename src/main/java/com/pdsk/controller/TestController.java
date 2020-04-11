package com.pdsk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2020/2/24 0024.
 */
@Controller
public class TestController {

    @RequestMapping("/myTest")
    public String ss(){

        return "test";
    }
}
