package cn.sunjiachao.s7blog.modules.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @RequestMapping(method = RequestMethod.GET,value = "/my/login")
    public String toUserLoginPage(){
        return "user/index";
    }

}
