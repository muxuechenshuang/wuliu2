package com.forest.wu.controller;

import com.alibaba.fastjson.JSONArray;
import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.MD5;
import com.forest.wu.utils.httpApiDemo.IndustrySMS;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.File;
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
@RequestMapping(value="/wuliu")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/index")
    public String index() {
        return "jzl/index";
    }
    //个人主页
    @RequestMapping(value = "/homepage")
    public String home(){
        return "jzl/personal";
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
                    session.setAttribute("user", ss.get(i));
                    session.setMaxInactiveInterval(3600);
                    return "xlh/main_xlh";
                }
            }
            i++;
        } while (i < ss.size());
        return "jzl/index";
    }

    //注销
    @RequestMapping("wuliu/index")
    public String devLogout(HttpSession session) {
        //        清除
        session.removeAttribute("user");
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



    //个人主页修改用户信息
@RequestMapping(value = "/personal", method = RequestMethod.POST)
public String persona(User user, BindingResult bindingResult, HttpServletRequest request, HttpSession session, @RequestParam(value="picPath",required= false) MultipartFile attach,
                      @RequestParam (value = "userid")String userid) {
//文件上传
    String PicPath = null;
    String logoLocPath = null;
    if (!attach.isEmpty()) {
        String path = request.getSession().getServletContext().getRealPath("statics" + java.io.File.separator + "uploadfiles");
        String path1 = request.getSession().getServletContext().getRealPath("statics");
        String oldFileName = attach.getOriginalFilename();//原文件名
        String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀
        int filesize = 5000000;
        if (attach.getSize() > filesize) {//上传大小不得超过 5M
            request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
            return "jzl/personal";
        } else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式
            String fileName = user.getUsername() + ".jpg";//上传头像图片重命名
            File targetFile = new File(path, fileName);

            try {
                //文件移动
                attach.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                return "jzl/personal";
            }
            PicPath = request.getContextPath() + "/statics/uploadfiles/" + fileName;
            logoLocPath = path + File.separator + fileName;
        } else {
            request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
            return "jzl/personal";
        }
    }

        //将更改后的值跟新
        user.setPicPath(PicPath);
        user.setId(Integer.parseInt(userid));
        userService.upHome(user);
        return "jzl/personal";

}
}
