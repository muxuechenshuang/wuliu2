package com.forest.wu.controller;

import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录注册Controller
 *
 * @author 蒋梓伦
 * @create 2018-09-29 9:31
 **/
@Controller
@RequestMapping(value = "/wuliu")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="/index")
    public String index(){

        return "/jzl/index";
    }
    //登录页面
    @RequestMapping(value = "/register",method= RequestMethod.POST)
    public String userAll(@RequestParam String user,@RequestParam String password, HttpSession session, HttpServletRequest request) {

        List<User> ss = userService.selectULogin();
        //循环查找
        int i=0;
        do {
            if (ss.get(i).getUsername().equals(user) || ss.get(i).getEmail().equals(user) || ss.get(i).getPhone().equals(user)) {
                if (ss.get(i).getPassword().equals(password)) {

                    String login = ss.get(i).getUsername();

                    session.setAttribute("Login", login);

                    String loginName = ss.get(i).getName();

                    session.setAttribute("LoginUser",loginName);

                    String loginV = ss.get(i).getValueName();

                    session.setAttribute("LoginV",loginV);

                    return "xlh/main_xlh";
                }
            }
            i++;
        } while (i < ss.size());
        return "jzl/index";

    }
}
