package com.forest.wu.controller;

import com.alibaba.fastjson.JSONArray;
import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.MD5;
import com.forest.wu.utils.httpApiDemo.IndustrySMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * 登录注册Controller
 *
 * @author 蒋梓伦
 * @create 2018-09-29 9:31
 **/
@Controller
@RequestMapping(value="/log")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/index")
    public String index() {
        return "jzl/index";
    }

    //登录页面
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String userAll(@RequestParam String user, @RequestParam String password, HttpSession session,HttpServletResponse response) throws IOException {
        List<User> ss = userService.selectULogin();

        //循环查询
        int i = 0;
        do {
            if (ss.get(i).getUsername().equals(user) || ss.get(i).getEmail().equals(user) || ss.get(i).getPhone().equals(user)) {
                if (ss.get(i).getPassword().equals(password)) {
                    //获取全部的登录信息
                    if(ss.get(i).getType().equals(1)) {
                        session.setAttribute(Constants.CLIENT_USER_SESSION, ss.get(i));
                    }else if(ss.get(i).getType().equals(2)){
                        session.setAttribute(Constants.COURIER_USER_SESSION, ss.get(i));
                    }else if(ss.get(i).getType().equals(3)){
                        session.setAttribute(Constants.SITE_USER_SESSION, ss.get(i));
                    }else if(ss.get(i).getType().equals(4)){
                        session.setAttribute(Constants.FILIALE_USER_SESSION, ss.get(i));
                    }else if(ss.get(i).getType().equals(5)) {
                        session.setAttribute(Constants.CENTER_USER_SESSION, ss.get(i));
                    }
                    session.setMaxInactiveInterval(3600);
                    return "xlh/main_xlh";
                }
            }
            i++;
        } while (i < ss.size());

        return "jzl/index";
    }

    //注销
    @RequestMapping("log/index")
    public String devLogout(HttpSession session) {
        //        清除
        session.removeAttribute(Constants.CLIENT_USER_SESSION);
        session.removeAttribute(Constants.COURIER_USER_SESSION);
        session.removeAttribute(Constants.SITE_USER_SESSION);
        session.removeAttribute(Constants.FILIALE_USER_SESSION);
        session.removeAttribute(Constants.CENTER_USER_SESSION);
        return "jzl/index";
    }

    //注册验证
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestParam String username, @RequestParam String email, @RequestParam String phone) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        List<User> name = userService.findUser();
        for (int i = 0; i < name.size(); i++) {
            //判断用户名是否已经存在
            if (name.get(i).getUsername().equals(username)) {
                resultMap.put("username", "nameVerification");
                return resultMap;

            }
            //判断邮箱是否已经存在
            if (name.get(i).getEmail().equals(email)) {
                resultMap.put("email", "emailVerification");
                return resultMap;
            }
            //判断手机号是否已经存在
            if (name.get(i).getPhone().equals(phone)) {
                resultMap.put("phone", "phoneVerification");
                return resultMap;
            }
        }

        return JSONArray.toJSONString(resultMap);
    }

    //注册页面
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    public String userLogin(User user) {
        User login = new User();
        //赋值
        login.setPassword(MD5.MD5(user.getPassword()));//MD5加密
        login.setUsername(user.getUsername());
        login.setEmail(user.getEmail());
        login.setPhone(user.getPhone());
        login.setType(1);
        login.setPicPath("/statics/uploadfiles/user.png");
        userService.addLogin(login);
        return "jzl/index";
    }

    //短信验证
    @RequestMapping(value = "/Verification", method = RequestMethod.POST)
    @ResponseBody
    public Object code(@RequestParam String phone) {
        IndustrySMS.setTo(phone);
        IndustrySMS.execute();//运行接口
        String result = IndustrySMS.getResult();//获取验证码
        return result;
    }




}
