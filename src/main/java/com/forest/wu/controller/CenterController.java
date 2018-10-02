package com.forest.wu.controller;

import com.forest.wu.pojo.Organization;
import com.forest.wu.pojo.User;
import com.forest.wu.service.CenterService;
import com.forest.wu.utils.Constants;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * 总公司
 *
 * @author 张展
 * @create 2018-09-29 14:51
 **/
@Controller
@RequestMapping("/center")
public class CenterController {
    @Autowired
    private CenterService centerService;

    /**
     * author: 张展
     * 分公司查询页面跳转
     * Date: 15:01 2018/9/30
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/soncompanylist", method = RequestMethod.GET)
    public String selectlist() {
        return "zz/fengongsichaxun_zz";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String select(Organization organization, Model model, HttpSession session) {
        List<Organization> list = null;
        Integer id = 0;
        String id1 = null;
        String phone =null;
        String name = null;

        try {
            list = centerService.selectSonCompany(organization);
        } catch (Exception e) {
            e.printStackTrace();
        }
        id = organization.getId();
        phone = organization.getPhone();
        name = organization.getName();
        /*if (!id.equals(0)) {
            id1 = String.valueOf(id);
        }*/
        model.addAttribute("id", id1);
        model.addAttribute("phone", phone);
        model.addAttribute("name", name);
        model.addAttribute("list", list);
        return "zz/fengongsichaxun_zz";
    }


    /**
     * author: 张展
     * 进入分公司添加页面
     * Date: 15:06 2018/9/30
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/addsoncompany", method = RequestMethod.GET)
    public String addSonCompany() {
        return "zz/fengongsitianjia_zz";
    }

    /*
     * @author: 张展
     * 保存分公司信息
     * @Date: 17:57 2018/9/29
     * @Param：[organization, session, request, attach]
     * @Return：java.lang.String
     **/
    @RequestMapping(value = "/addSave", method = RequestMethod.POST)
    public String addSave(Organization organization) {

        organization.setType(2);
        organization.setParentId(1);
        try {
            if (centerService.addSonCompany(organization) > 0) {
                //成功以后要显示新增加的信息要重定向分公司列表(会刷新一次)
                return "redirect:/center/soncompanylist";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "center/addsoncompany";
    }

    /*
     * @author: 张展
     * 添加分公司操作人员（未完成）
     * @Date: 17:04 2018/9/29
     * @Param：[organization]
     * @Return：java.lang.String
     **/
    @RequestMapping(value = "/addsonperson", method = RequestMethod.GET)
    public String addSonCompanyPerson(@ModelAttribute("organization") Organization organization) {
        return "/zz/fengongcaozuositianjia_zz";
    }

    @RequestMapping(value = "/addSave1", method = RequestMethod.POST)
    public String addSave1(User user, HttpSession session, HttpServletRequest request,
                           @RequestParam(value = "logoPicPath", required = false) MultipartFile attach) {
        String logoPicPath = null;
        String logoLocPath = null;
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics" + java.io.File.separator + "uploadfiles");
            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀
            int filesize = 1000000;
            if (attach.getSize() > filesize) {//上传大小不得超过 1000k
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
                return "center/addsonperson";
            } else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式
                String fileName = user.getUsername() + ".jpg";//上传LOGO图片重命名
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                    return "center/addsonperson";
                }
                logoPicPath = request.getContextPath() + "/statics/uploadfiles/" + fileName;
                logoLocPath = path + File.separator + fileName;
            } else {
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
                return "center/addsonperson";
            }
        }
        user.setLogo(logoPicPath);

        try {
            if (centerService.addSonCompanyPerson(user) > 0) {
                //要显示新增加的信息要重定向(会刷新一次)
                return "redirect:/center/soncompanylist";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "center/addsonperson";
    }
}
