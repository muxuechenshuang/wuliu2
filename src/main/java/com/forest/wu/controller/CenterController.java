package com.forest.wu.controller;

import com.forest.wu.pojo.*;
import com.forest.wu.service.CenterService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
//            model.addAttribute("returnorder",returnorder);
            model.addAttribute("list1", list1);
            model.addAttribute("id",returnorder.getId());
            model.addAttribute("yid",returnorder.getYid());
            model.addAttribute("gid",returnorder.getGid());
            model.addAttribute("gName",returnorder.getgName());
            model.addAttribute("status",returnorder.getStatus());


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


//    @RequestMapping(value = "/shenhe")
//    public String shenhe(String id ,Integer status,String comment){
//        try {
//            Return returnorder = centerService.selectRetrunById(id);
//            returnorder.setStatus(status);
//            returnorder.setAuditTime(new Date());
//            returnorder.setComment(comment);
////            model.addAttribute("returnorder",returnorder);
//            //需要更新操作
//            centerService.updateReturn(returnorder);
//
//            return "redirect:/center/returnlist";
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "center/returnlist";
//    }

    /**
    * author: 张展
    * 审核通过更新返货单信息（隐藏域获取返货单ID）
    * Date: 10:46 2018/10/6
    * Param：
    * Return：
    **/
    @RequestMapping(value = "/addSave4")
    public String addSave4(@RequestParam(value = "comment",required=false) String comment,
                           @RequestParam(value = "rid")String rid){

        Return returnorder = null;
        try {
            returnorder = centerService.selectRetrunById(rid);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //不封装对象，直接后台获取对象
        returnorder.setStatus(2);
        returnorder.setAuditTime(new Date());
        returnorder.setComment(comment);
        try {
            centerService.updateReturn(returnorder);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/center/returnlist";
    }

    /**
     * author: 张展
     * 审核不通过更新返货单信息（隐藏域获取返货单ID）
     * Date: 10:46 2018/10/6
     * Param：
     * Return：
     **/
    @RequestMapping(value = "/addSave5")
    public String addSave5(@RequestParam(value = "comment",required=false) String comment,
                           @RequestParam(value = "rid")String rid){

        Return returnorder = null;
        try {
            returnorder = centerService.selectRetrunById(rid);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //不封装对象，直接后台获取对象
        returnorder.setStatus(3);
        returnorder.setAuditTime(new Date());
        returnorder.setComment(comment);
        try {
            centerService.updateReturn(returnorder);
        } catch (Exception e) {
            e.printStackTrace();
        }
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


    /**
    * author: 张展
    * 查询分公司管理人员列表
    * Date: 13:43 2018/10/8
    * Param：[user, model]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/finduser")
    public String finduser(User user,Model model){
        try {
            List<User> list = centerService.selectCompanyPerson(user);
            model.addAttribute("list",list);
            model.addAttribute("id",user.getId());
            model.addAttribute("phone",user.getPhone());
            model.addAttribute("parentid",user.getParentid());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fengongsiguanlichaxun_zz";
    }
    
    /**
    * author: 张展
    * 分公司管理员信息详情
    * Date: 14:15 2018/10/8
    * Param：[userid]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/userDetail")
    public String userDetail(Integer userid,Model model){
        try {
            User user = centerService.selectByUserId(userid);
            model.addAttribute("user",user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fengongsiguanlixiangqing_zz";
    }

    /*
     * @author: 张展
     * 添加分公司管理员
     * @Date: 17:04 2018/9/29
     * @Param：[organization]
     * @Return：java.lang.String
     **/
    @RequestMapping(value = "/addsonperson")
    public String addSonCompanyPerson(@ModelAttribute("user") User user) {
        return "zz/fengongsiguanlitianjia_zz";
    }
    
    /**
    * author: 张展
    * 删除分公司管理人员
    * Date: 14:40 2018/10/8
    * Param：[userid]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/delectUser")
    public String  delectUser(Integer userid){
        try {
            centerService.delectSonCompanyPerson(userid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zz/fengongsiguanlichaxun_zz";
    }
    
    /**
    * author: 张展
    * 分公司管理员信息的保存
    * Date: 11:25 2018/10/8
    * Param：
    * Return：
    **/
    @RequestMapping(value = "/addSave1",method = RequestMethod.POST)
    public String addSave1(User user, BindingResult bindingResult,HttpSession session, HttpServletRequest request,
                           @RequestParam(value = "picpath", required = false) MultipartFile attach) {
        String PicPath = null;
        String logoLocPath = null;
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics" + java.io.File.separator + "uploadfiles");
//            System.out.println(path);
            String path1 = request.getSession().getServletContext().getRealPath("statics");
            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀
            int filesize = 5000000;
            if (attach.getSize() > filesize) {//上传大小不得超过 5M
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
                return "center/addsonperson";
            } else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式
                String fileName = user.getUsername() + ".jpg";//上传头像图片重命名
                File targetFile = new File(path, fileName);

//                //新代码开始
//                // 项目在容器中实际发布运行的根路径
//                String realPath = request.getSession().getServletContext().getRealPath("/");
//                // 自定义的文件名称
//                String trueFileName = String.valueOf(System.currentTimeMillis()) + "." + type;
//                // 设置存放图片文件的路径
//                path = realPath+/*System.getProperty("file.separator")+*/trueFileName;
//                System.out.println("存放图片文件的路径:"+path);
//                // 转存文件到指定的路径
//                file.transferTo(new File(path));
//                System.out.println("文件成功上传到指定目录下");
////                新代码结束

                if (!targetFile.exists()) {
                    //boolean mkdirs() :  创建此抽象路径名指定的目录，包括创建必需但不存在的父目录。
                    targetFile.mkdirs();
                }
                try {
                    //文件移动
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                    return "center/addsonperson";
                }
                PicPath = request.getContextPath() + "/statics/uploadfiles/" + fileName;
                logoLocPath = path + File.separator + fileName;
            } else {
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
                return "center/addsonperson";
            }
        }
        user.setPicpath(PicPath);
        user.setTime(new Date());
        try {
            if (centerService.addSonCompanyPerson(user) > 0) {
                //要显示新增加的信息要重定向(会刷新一次)
                return "redirect:/center/finduser";
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
        model.addAttribute("result", workorder.getAuditStatus());


        return "zz/gondan2_zz";
    }

    /**
     * author: 张展
     * 跳转分公司详情页面，带一个id
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
    public String addSave2(@ModelAttribute("organization") Organization organization) {
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
    * 工单信息保存
    * Date: 10:32 2018/10/8
    * Param：
    * Return：
    **/
    @RequestMapping(value = "/addSave3")
    public String addSave3(Workorder workorder) {
        int id = workorder.getId();
        try {
            centerService.updateWorkOrder(workorder);
            return "redirect:/center/selectworkorder";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "center/todetail?workoderid="+id;
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
