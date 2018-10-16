package com.forest.wu.controller;

import com.forest.wu.excel.ExcelUtil;
import com.forest.wu.pojo.*;
import com.forest.wu.service.*;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

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
    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private NoteService noteService;


    /**
    * author: 张展
    * 返货单列表
    * Date: 10:56 2018/10/5
    * Param：[returnorder, model]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/returnlist")
    public String returnlist( @RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
                              Return returnorder, Model model,HttpSession session) {
        try {
            PageHelper.startPage(Integer.parseInt(pageIndex), Constants.PAGE_SIZE);
            List<Return> list1 = centerService.selectReturn(returnorder);
            PageInfo<Return> p = new PageInfo<Return>(list1);
            model.addAttribute("page", p);
            model.addAttribute("list1", list1);
            session.setAttribute("list1",list1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("id",returnorder.getId());
        model.addAttribute("yid",returnorder.getYid());
        model.addAttribute("gid",returnorder.getGid());
        model.addAttribute("gName",returnorder.getgName());
        model.addAttribute("status",returnorder.getStatus());

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
    public String select(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
                         Organization organization, Model model, HttpSession session) {
        try {
            PageHelper.startPage(Integer.parseInt(pageIndex), Constants.PAGE_SIZE,"id desc");
            List<Organization> list = centerService.selectSonCompany(organization);
            PageInfo<Organization> p = new PageInfo<Organization>(list);
            model.addAttribute("page", p);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //回显
        model.addAttribute("id", organization.getId());
        model.addAttribute("phone", organization.getPhone());
        model.addAttribute("name", organization.getName());

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
        return "/center/addsoncompany";
    }


    /**
    * author: 张展
    * 查询分公司管理人员列表
    * Date: 13:43 2018/10/8
    * Param：[user, model]
    * Return：java.lang.String
    **/
    @RequestMapping(value = "/finduser")
    public String finduser(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
                           User user,Model model){
        try {
            PageHelper.startPage(Integer.parseInt(pageIndex), Constants.PAGE_SIZE,"id desc");
            List<User> list = centerService.selectCompanyPerson(user);
            PageInfo<User> p = new PageInfo<User>(list);
            model.addAttribute("page", p);
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
    public String addSonCompanyPerson() {
        return "zz/fengongsiguanlitianjia_zz";
    }
    
    /**
    * author: 张展
    * 删除分公司管理人员
    * Date: 14:40 2018/10/8
    * Param：[userid]
    * Return：java.lang.String
    **/
//    @RequestMapping(value = "/delectUser")
//    public String  delectUser(Integer userid){
//        try {
//            centerService.delectSonCompanyPerson(userid);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "zz/fengongsiguanlichaxun_zz";
//    }

    /**
     * author: 张展
     * 删除分公司管理员
     * Date: 16:36 2018/10/9
     * Param：[userid]
     * Return：java.lang.String
     **/
    @RequestMapping(value = "/delectuser")
    public String delectuser(Integer userid) {

        try {
            if (centerService.delectSonCompanyPerson(userid) > 0) {
                //要显示信息要重定向(会刷新一次)
                return "redirect:/center/finduser";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "redirect:/center/finduser";
    }
    
    /**
    * author: 张展
    * 新增分公司管理员信息的保存
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
                return "zz/fengongsiguanlitianjia_zz";
            } else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式
                String fileName = user.getUsername() + "."+prefix;//上传头像图片重命名
                File targetFile = new File(path, fileName);


                try {
                    //文件移动
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                    return "zz/fengongsiguanlitianjia_zz";
                }
                PicPath = request.getContextPath() + "/statics/uploadfiles/" + fileName;
                logoLocPath = path + File.separator + fileName;
            } else {
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
                return "zz/fengongsiguanlitianjia_zz";
            }
        }
        user.setPicPath(PicPath);
        user.setTime(new Date());
        user.setType(4);
        try {
            if (centerService.addSonCompanyPerson(user) > 0) {
                //要显示新增加的信息要重定向(会刷新一次)
                return "redirect:/center/finduser";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "redirect:/center/addsonperson";
    }

    /**
     * author: 张展
     * 分公司管理员信息的保存(更新)
     * Date: 11:25 2018/10/8
     * Param：
     * Return：
     **/
    @RequestMapping(value = "/addSave6",method = RequestMethod.POST)
    public String addSave6(User user, BindingResult bindingResult,HttpSession session, HttpServletRequest request,
                           @RequestParam(value = "picpath", required = false) MultipartFile attach) {
        String PicPath = null;
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics" + java.io.File.separator + "uploadfiles");
            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀
            int filesize = 5000000;
            if (attach.getSize() > filesize) {//上传大小不得超过 5M
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
                return "center/addsonperson";
            } else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("gif")) {//上传图片格式
                String fileName = user.getUsername() + ".jpg";//上传头像图片重命名
                File targetFile = new File(path, fileName);
                try {
                    //文件移动
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                    return "redirect:/center/addsonperson";
                }
                PicPath = request.getContextPath() + "/statics/uploadfiles/" + fileName;
            } else {
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
                return "redirect:/center/finduser";
            }
        }
        user.setPicPath(PicPath);
        try {
            if (centerService.updateUserById(user) > 0) {
                //要显示信息要重定向(会刷新一次)
                return "redirect:/center/finduser";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "redirect:/center/finduser";
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
            List<Organization> cityList = organizationService.filialeList();
            model.addAttribute("cityList", cityList);
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
    public String selectworkOrder( @RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
                                  Workorder workorder, Model model) {
        List<Organization> cityList = organizationService.filialeList();
        model.addAttribute("cityList", cityList);
        List workStatusList = centerService.workStatus();
        model.addAttribute("workStatusList", workStatusList);
        try {
            PageHelper.startPage(Integer.parseInt(pageIndex), Constants.PAGE_SIZE, "id desc");
            List<Workorder> workorderList = centerService.selectWorkOrder(workorder);
            PageInfo<Workorder> p = new PageInfo<Workorder>(workorderList);
            model.addAttribute("page", p);
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
            List<Organization> cityList = organizationService.filialeList();
            model.addAttribute("cityList", cityList);
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
    @RequestMapping(value = "/delect")
    public String delect(@RequestParam(value = "organizationid") String organizationid) {
        try {
            if (centerService.delectSonCompany(Integer.valueOf(organizationid))>0);
            return "redirect:/center/soncompanylist";
//            return centerService.delectSonCompany(Integer.valueOf(organizationid));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/center/soncompanylist";
    }

    /**
    * author: 张展
    * 工单信息保存
    * Date: 10:32 2018/10/8
    * Param：
    * Return：
    **/
    @RequestMapping(value = "/addSave3")
    public String addSave3(Workorder workorder,BindingResult bindingResult) {
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
    /**
     * @author: 张展
     * @Description 获取下拉框
     * @Date: 16:26 2018/10/4
     * @Param：Model,String(_cityId),String(_branchId)
     * @return：ry/send_ry 进入寄件页面
     */
    @RequestMapping(value = "/cityList", method = RequestMethod.GET)
    public String cityList(Model model
                          , @RequestParam(value = "sCity", required = false) String _cityId,
                           @RequestParam(value = "sPoint", required = false) String _branchId
    ) {
        List<Organization> cityList = organizationService.filialeList();

        model.addAttribute("cityList", cityList);

        if (null != _cityId && !"".equals(_cityId) && null != _branchId && !"".equals(_branchId)) {
            Integer cityId = Integer.parseInt(_cityId);
            Integer branchId = Integer.valueOf(_branchId);
            List<Organization> branchList = organizationService.selectByParentId(cityId);
            model.addAttribute("branchList", branchList);
            model.addAttribute("cityId", cityId);
            model.addAttribute("branchId", branchId);
        }

        return "zz/gondan2_zz";
    }

    /**
     * @author: 任一
     * @Description ajax返回网点列表
     * @Date: 16:28 2018/10/4
     * @Param：
     * @return：List<Organization>
     */
    @RequestMapping(value = "queryBranchList.json")
    @ResponseBody
    public List<Organization> queryBranchList(@RequestParam Integer parentId) {
        List<Organization> branchList = organizationService.selectByParentId(parentId);
        return branchList;
    }


    @RequestMapping(value = "/baobiao3")
    public String baobiao2(){
        return "zz/baobiao3";
    }

    @ResponseBody
    @RequestMapping(value = "/shuju3.json")
    public Object shuju3(Model model) {
        List y = new ArrayList();
//        Map<String, Object> map = new HashMap<String, Object>();
        try {
            int a = centerService.workorderCount(2);
            y.add(a);
            int b = centerService.workorderCount(3);
            y.add(b);
            int c = centerService.workorderCount(9);
            y.add(c);
            int d = centerService.workorderCount(10);
            y.add(d);

        } catch (Exception e) {
            e.printStackTrace();
        }
//        List x = new ArrayList();
//        List y = new ArrayList();
//        for (int i=1;i<21;i++){
//            x.add(i);
//            y.add(a);
//        }
//        model.addAttribute("x",x);
//        model.addAttribute("y",y);
        return y;
    }

    /**
    * author: 张展
    * 导出返货单列表
    * Date: 18:37 2018/10/15
    * Param：[session, model]
    * Return：void
    **/
    @RequestMapping(value = "excel")
    public void excel(HttpServletResponse response,HttpSession session, Model model){
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
            List<Return> list1 = (List<Return>) session.getAttribute("list1");
//            for (int j=0;j<list1.size();j++) {
//                list1.get(j).setCtreatimeName(simpleDateFormat.format(list1.get(j).getCtreaTime()));
////                list1.get(j).setAuditTimeName(simpleDateFormat.format(list1.get(j).getAuditTime()));
//            }
            for (Return r:list1
                 ) {
                if (r.getCtreaTime()!=null){
                    r.setCtreatimeName(simpleDateFormat.format(r.getCtreaTime()));
                }
                if (r.getAuditTime()!=null){
                    r.setAuditTimeName(simpleDateFormat.format(r.getAuditTime()));
                }
            }
            ExcelUtil.writeExcel(response,list1,"返货单列表","返货单",new Return());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
