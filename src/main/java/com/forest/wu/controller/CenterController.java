package com.forest.wu.controller;

import com.forest.wu.pojo.*;
import com.forest.wu.service.CenterService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    * 返货单列表
    * Date: 10:56 2018/10/5
    * Param：[returnorder, model]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/returnlist")
    public String returnlist(Return returnorder, Model model) {
        try {
            List<Return> list1 = centerService.selectReturn(returnorder);
            model.addAttribute("list1", list1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fanhuodanlist_zz";
    }

    /**
     * author: 张展
     * 返货单详情
     * Date: 10:54 2018/10/5
     * Param：[workorderid, model]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/returndetail")
    public String returndetail(@RequestParam(value = "id") String id, Model model) {
        try {
            Return returnorder = centerService.selectRetrunById(id);
            model.addAttribute("returnorder", returnorder);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fanhuodanxiangqing_zz";
    }


    @RequestMapping(value = "/shenhe")
    public String shenhe(String id ,Integer status,String comment){
        try {
            Return returnorder = centerService.selectRetrunById(id);
            returnorder.setStatus(status);
            returnorder.setAuditTime(new Date());
            returnorder.setComment(comment);
//            model.addAttribute("returnorder",returnorder);
            //需要更新操作
            centerService.updateReturn(returnorder);

            return "redirect:/center/returnlist";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "center/returnlist";
    }

    /**
    * author: 张展
    * 更新返货单信息
    * Date: 10:46 2018/10/6
    * Param：
    * Return：
    **/
    public String addSave4(@RequestParam(value = "flase")Return returnorder, Model model){

        return "redirect:/center/returnlist";
    }

    /**
     * author: 张展
     * 分公司查询页面跳转
     * Date: 15:01 2018/9/30
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/tosoncompanylist")
    public String selectlist() {
        return "zz/fengongsichaxun_zz";
    }

    /**
     * author: 张展
     * 分公司查询
     * Date: 15:21 2018/10/3
     * Param：[organization, model, session]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/soncompanylist")
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
        //回显
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


    //    报表
    @RequestMapping(value = "/baobiao1")
    public String baobiao1() {
        return "zz/baobiao1_zz";
    }


    //    分公司添加
    @RequestMapping(value = "/addsoncompany")
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
    @RequestMapping(value = "/addSave")
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
        //信息保存失败重新返回新增页面
        return "center/addsoncompany";
    }

    /*
     * @author: 张展
     * 添加分公司操作人员（未完成）
     * @Date: 17:04 2018/9/29
     * @Param：[organization]
     * @Return：java.lang.String
     **/
    @RequestMapping(value = "/addsonperson")
    public String addSonCompanyPerson(@ModelAttribute("organization") Organization organization) {
        return "/zz/fengongsiguanlitianjia_zz";
    }

    @RequestMapping(value = "/addSave1")
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
     * 跳转工单详情页面
     * Date: 10:09 2018/10/3
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/todetail")
    public String todetail(@RequestParam(value = "workorderid") String workorderid, Model model) {
        try {
            Workorder workorder = centerService.selectWorkOrdById(Integer.valueOf(workorderid));
            model.addAttribute("workorder", workorder);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/xiangqing_zz";
    }


    /**
     * author: 张展
     * 跳转工单查询页面
     * Date: 10:59 2018/10/2
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/toselectworkorder")
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
//            系统自动封装对象已经转型
//            if (workorder.getPackageId()!=null){
//                workorder.setPackageId(Integer.parseInt(workorder.getPackageId()));
//            }
            List<Workorder> workorderList = centerService.selectWorkOrder(workorder);
            PageInfo<Workorder> p = new PageInfo<Workorder>(workorderList);
            model.addAttribute("pageIndex", p);
            model.addAttribute("workorderList", workorderList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //回显
        model.addAttribute("workNum", workorder.getWorkNum());
        model.addAttribute("orderNum", workorder.getOrderNum());
        model.addAttribute("productNum", workorder.getProductNum());
        model.addAttribute("packageId", workorder.getPackageId());
        model.addAttribute("sName", workorder.getsName());
        model.addAttribute("sTel", workorder.getsTel());
        model.addAttribute("sPoint", workorder.getsPoint());
        model.addAttribute("sCity", workorder.getsCity());
        model.addAttribute("gName", workorder.getgName());
        model.addAttribute("gTel", workorder.getgTel());
        model.addAttribute("gCity", workorder.getgCity());
        model.addAttribute("gPoint", workorder.getgPoint());
        model.addAttribute("workStatus", workorder.getWorkStatus());
        //上门收快递员工编号
        model.addAttribute("gCourier", workorder.getgCourier());
        //送
        model.addAttribute("sCourier", workorder.getsCourier());
        model.addAttribute("result", workorder.getResult());


        return "zz/gondan2_zz";
    }

    /**
     * author: 张展
     * 跳转分公司详情页面，带一个对象
     * Date: 10:09 2018/10/3
     * Param：[]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/tosondetail")
    public String tosondetail(@RequestParam(value = "organizationid") String organizationid, Model model) {
        try {
            Organization organization = centerService.selectById(Integer.valueOf(organizationid));
            model.addAttribute("organization", organization);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fengongsixiangqing_zz";
    }

    /**
     * author: 张展
     * 分公司信息修改的保存
     * Date: 11:42 2018/10/4
     * Param：[organization]
     * Return：java.lang.Integer
     **/
    @RequestMapping(value = "/addSave2")
    public String addSave2(Organization organization) {
        try {
            if (centerService.updateSonCompany(organization) > 0) {
                //成功以后要显示新的信息要重定向分公司列表(会刷新一次)
                return "redirect:/center/soncompanylist";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //信息保存失败重新返回新增页面
        return "center/tosondetail?organizationid=${organization.id}";
    }

    /**
     * author: 张展
     * 根据ID删除分公司
     * Date: 15:43 2018/10/4
     * Param：[]
     * Return：java.lang.String
     **/
    @ResponseBody
    @RequestMapping(value = "/delect.json")
    public Integer delect(@RequestParam(value = "organizationid") String organizationid) {
        try {
//            if (centerService.delectSonCompany(Integer.valueOf(organizationid))>0);
//            return "redirect:/center/soncompanylist";
            return centerService.delectSonCompany(Integer.valueOf(organizationid));
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return "/center/soncompanylist";
        return 0;
    }


    /**
     * author: 张展
     * 总部查询所有工单
     * Date: 10:03 2018/10/2
     * Param：[pageIndex, model]
     * Return：java.lang.String
     **/
//    @RequestMapping("/allorder_c")
//    public String allOrder_c(@RequestParam(required = true, defaultValue = "1") Integer pageIndex, Model model) {
//        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
//        List<Order_info> orderList=orderService.selectAllOrder();
//        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
//        model.addAttribute("pageIndex",p);
//        model.addAttribute("order",orderList);
//        return "zz/xiangqing_zz";
//    }
}
