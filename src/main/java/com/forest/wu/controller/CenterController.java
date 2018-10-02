package com.forest.wu.controller;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.Organization;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.CenterService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
        String phone = null;
        String name = null;

        try {
            list = centerService.selectSonCompany(organization);
        } catch (Exception e) {
            e.printStackTrace();
        }
        id = organization.getId();
        phone = organization.getPhone();
        name = organization.getName();
        System.out.println(list.toString());
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


    /**
     * author: 张展
     * 跳转工单查询页面
     * Date: 10:59 2018/10/2
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/toselectworkorder", method = RequestMethod.GET)
    public String toselectWorkOrder() {
        return "zz/gondan2_zz";
    }

    /**
     * author: 张展
     * 总公司工单查询（条件）
     * Date: 10:00 2018/10/2
     * Param：[pageIndex, queryOrderNum, querysName, querysTel, order, model]
     * Return：java.lang.String
     **/
    @RequestMapping("/selectworkorder")
    public String selectworkOrder(@RequestParam(required = true, defaultValue = "1") Integer pageIndex,
                                  Workorder workorder, Model model) {
//        String workNum = null;

        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        try {
            if (workorder.getPackageId()!=null){
                workorder.setPackageId(Integer.parseInt(workorder.getPackageId()));
            }
            List<Workorder> workorderList = centerService.selectWorkOrder(workorder);
            PageInfo<Workorder> p = new PageInfo<Workorder>(workorderList);
            model.addAttribute("pageIndex", p);
            model.addAttribute("workorderList", workorderList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //回显
        model.addAttribute("workNum",workorder.getWorkNum());
        model.addAttribute("orderNum",workorder.getOrderNum());
        model.addAttribute("productNum",workorder.getProductNum());
        model.addAttribute("packageId",workorder.getPackageId());
        model.addAttribute("sName",workorder.getsName());
        model.addAttribute("sTel",workorder.getsTel());
        model.addAttribute("sPoint",workorder.getsPoint());
        model.addAttribute("sCity",workorder.getsCity());
        model.addAttribute("gName",workorder.getgName());
        model.addAttribute("gTel",workorder.getgTel());
        model.addAttribute("gCity",workorder.getgCity());
        model.addAttribute("gPoint",workorder.getgPoint());
        model.addAttribute("workStatus",workorder.getWorkStatus());
        //上门收快递员工编号
        model.addAttribute("gCourier",workorder.getgCourier());
        //送
        model.addAttribute("sCourier",workorder.getsCourier());
        model.addAttribute("result",workorder.getResult());


        return "zz/gondan2_zz";
    }

    /**
     * author: 张展
     * 总部查询所有订单
     * Date: 10:03 2018/10/2
     * Param：[pageIndex, model]
     * Return：java.lang.String
     **/
    @RequestMapping("/allorder_c")
    public String allOrder_c(@RequestParam(required = true, defaultValue = "1") Integer pageIndex, Model model) {
        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
//        List<Order_info> orderList=orderService.selectAllOrder();
//        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
//        model.addAttribute("pageIndex",p);
//        model.addAttribute("order",orderList);
        return "zz/xiangqing_zz";
    }
}
