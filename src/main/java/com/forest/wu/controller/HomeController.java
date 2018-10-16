package com.forest.wu.controller;

import com.alibaba.fastjson.JSONArray;
import com.forest.wu.pojo.Note;
import com.forest.wu.pojo.User;
import com.forest.wu.service.NoteService;
import com.forest.wu.service.UserService;
import com.forest.wu.utils.Constants;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;

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
    @Resource
    private NoteService noteService;
    //登录后的页面
    @RequestMapping(value = "/main")
    public String main(Model model,HttpSession session){
        //增加站内信，只有用户才有
        Integer type =((User)session.getAttribute("user")).getType();
        if(type == 1){
            Integer id = ((User) session.getAttribute("user")).getId();
            getNote(id, model);
        }
        return "xlh/main_xlh";
    }
    //个人主页
    @RequestMapping(value = "/homepage")
    public String home(Model model,HttpSession session){
        //增加站内信，只有用户才有
        Integer type =((User)session.getAttribute("user")).getType();
        if(type == 1){
            Integer id = ((User) session.getAttribute("user")).getId();
            getNote(id, model);
        }
        return "jzl/personal";
    }
    //跟新验证
    @RequestMapping(value = "/login")
    @ResponseBody
    public Object login(@RequestParam String email, @RequestParam String phone,HttpSession session) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Integer id = ((User) session.getAttribute("user")).getId();
        User user = userService.selectByPrimaryKey(id);

        if (!user.getEmail().equals(email)) {
            System.out.println(user.getEmail());
         if (userService.findUser1(email) != null) {
            resultMap.put("email", "emailVerification");
        } else {
            resultMap.put("email", "email");
        }
        }

        if(!user.getPhone().equals(phone)){
            System.out.println(user.getPhone());
         if (userService.findUser2(phone) != null) {
            resultMap.put("phone", "phoneVerification");
        } else {
            resultMap.put("phone", "phone");
        }
        }
        return resultMap;
    }

    //个人主页修改用户信息
    @RequestMapping(value = "/personal", method = RequestMethod.POST)
    public String persona(User user, BindingResult bindingResult, HttpSession session,
                          @RequestParam (value = "userid")String userid) {
        user.setId(Integer.parseInt(userid));
        userService.upHome(user);
        session.setAttribute("user",user);
        return "xlh/main_xlh";
    }


    //个人主页头像
    @RequestMapping(value = "/personal2", method = RequestMethod.POST)
    public String persona1(User user, BindingResult bindingResult, HttpServletRequest request, HttpSession session, @RequestParam(value="picPath",required= false) MultipartFile attach,
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
        return "xlh/main_xlh";

    }

    //站内信息
    public void getNote(Integer id, Model model) {
        //信息集合
        List<Note> noteList = noteService.getNoteSelf(id);
        model.addAttribute("noteList", noteList);

        //未读邮件数
        Integer noRead = noteService.noReadCount(id);
        model.addAttribute("noRead", noRead);
    }
    //删除图片
    @RequestMapping(value = "/delfile",method=RequestMethod.GET)
    @ResponseBody
    public Object delFile(@RequestParam(value="flag",required=false) String flag,
                          @RequestParam(value="id",required=false) String id,HttpServletRequest request){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
        String fileLocPath = null;
        if(flag == null || flag.equals("") ||
                id == null || id.equals("")){
            resultMap.put("result", "failed");
        }else if (flag.equals("logc")){

            try {

                fileLocPath = path+"/"+(userService.selectByPrimaryKey(Integer.parseInt(id))).getPicPath();
                File file = new File(fileLocPath);
                if(file.exists())
                    resultMap.put("result", "success");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

            }else if(flag.equals("logo")){//删除logo图片（操作app_info）
            try {
                File file = new File(fileLocPath);
                if(file.delete()){//删除服务器存储的物理文件
                    if(userService.deleteAppLogo(Integer.parseInt(id))){//更新表
                        resultMap.put("result", "success");
                    }
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return JSONArray.toJSONString(resultMap);
    }
}
