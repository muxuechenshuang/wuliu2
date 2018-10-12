package com.forest.wu.controller;

import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.interceptor.Auth;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * 个人主页
 *
 * @author 蒋梓伦
 * @create 2018-10-11 11:31
 **/
@Controller
@RequestMapping(value="/wu")
public class HomeController {

    @Autowired
    private UserService userService;

    //个人主页
    @RequestMapping(value = "/homepage")
    public String home(){
        return "jzl/personal";
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
                    || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("gif")) {//上传图片格式
                String fileName = user.getUsername() + "."+prefix;//上传头像图片重命名
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
        session.setAttribute("user",user);
        return "jzl/personal";

    }
}
