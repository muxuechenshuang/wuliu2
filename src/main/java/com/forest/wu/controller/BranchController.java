package com.forest.wu.controller;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.Organization;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.CourierService;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 网点
 *
 * @author 李普强
 * @create 2018-09-29 9:34
 **/
@Controller
@RequestMapping(value = "/wuliu")
public class BranchController {
    @Autowired
    private CourierService  courierService;

    @Autowired
    private Order_infoMapper order_infoMapper;
    //点击跳转到员工管理页面
    @RequestMapping(value = "/yuan")
    public String guanLiYe(){
        return  "redirect:/wuliu/list";
    }
    //点击跳转到查询订单信息页面
    @RequestMapping(value = "/dingdan")
    public String dingDanYe(){
        return "redirect:/wuliu/ding";
    }

    //快递员+分页
    @RequestMapping(value = "/list")
    public String selectUser(Model model, @RequestParam(value = "id",required = false) String id,
                             @RequestParam(value = "username",required = false) String username,
                             @RequestParam(value = "phone",required = false) String phone,
                             @RequestParam(value = "email" ,required = false) String email,
                             @RequestParam(value = "pageIndex",required = false) String pageIndex,
                             HttpSession session){
        User user=(User)session.getAttribute("user");
        Integer type=2;//用户角色
        Integer parentid=user.getParentid();//所属组织
        Integer pageNo=1;//当前页
        Integer pageSize=5;//页大小
        if(pageIndex!=null){
            pageNo=Integer.valueOf(pageIndex);
        }

        if(id==null){
            id="";
        }
        if(username==null){
            username="";
        }
        if(phone==null){
            phone="";
        }
        if(email==null){
            email="";
        }

        int count=0;//总记录数
        count=courierService.count(id, username, phone, email,type,parentid);


        //创建page分页对象
        Page page=new Page();
        page.setPageSize(pageSize);
        page.setCount(count);
        int pageCount=page.getPageCount();

        if(count<=pageSize){//总记录数小于页大小
            pageCount=1;
        }
        //控制首尾页
        if(pageNo<1){
            pageNo=1;
        }else if(pageNo>pageCount){
            pageNo=pageCount;
        }
        page.setPageNo(pageNo);//控制首尾页之后再设置当前页pageNo


        Integer pageNos=(pageNo-1)*pageSize;
        //快递员对象集合
        List<User> listUser= courierService.selectUsers(id,username,phone,email,pageNos,pageSize,type,parentid);
        model.addAttribute("listUser",listUser);
        model.addAttribute("page",page);
        model.addAttribute("id",id);
        model.addAttribute("username",username);
        model.addAttribute("phone",phone);
        model.addAttribute("email",email);

        System.out.print("李普强");
        return  "lpq/yuangong2";
    }


    //点击快递员个人详情，跳转到员工详情页
    @RequestMapping(value="/xiang")
    public String getXiang(@RequestParam(value = "id")String id,Model model){
        User user=courierService.getUser(id);
        model.addAttribute("user",user);
        return "lpq/yuangongxiangqing2";
    }
    //点击修改快递员个人信息后保存的方法
    @RequestMapping(value = "/xiang",method = RequestMethod.POST)
    public  String updateUser(User user){

        user.setTime(new Date());
        user.setType(Integer.valueOf(3));
        System.out.print(user.getEmail());
        int result=courierService.updateUser(user);
        if(result>0){
            return "redirect:/wuliu/list";
        }
        return "lpq/yuangongxiangqing2";
    }


    //订单+分页
    @RequestMapping(value = "/ding")
    public String selectOrder(Model model,
                              Order_info order_info,
                              HttpSession session,
                              @RequestParam(value = "pageIndex" ,required = false)String pageIndex){
        User user=(User)session.getAttribute("user");
        Integer id =null;
        String  gName=null;
        String  sTel=null;
        Integer status=null;

        if(!StringUtils.isEmpty(order_info.getId())){
            id=Integer.valueOf(order_info.getId());
        }
        if(!StringUtils.isEmpty(order_info.getgName())){
            gName=order_info.getgName();
        }
        if(!StringUtils.isEmpty(order_info.getsTel())){
            sTel=order_info.getsTel();
        }
        if(!StringUtils.isEmpty(order_info.getStatus())){
            status=Integer.valueOf(order_info.getStatus());
        }

        Integer pageNum=1;//当前页
        if(pageIndex!=null){
            pageNum=Integer.valueOf(pageIndex);
        }


        //PageHelper用户分页的
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE);//Constants.PAGE_SIZE=5
        List<Order_info> listOrder= courierService.selectOrder(id, gName, sTel,status,user.getParentid());
        PageInfo<Order_info> pages = new PageInfo<Order_info>(listOrder);
        List<User>listUser=courierService.allUser(user.getParentid());
        model.addAttribute("listUser",listUser);
        model.addAttribute("listOrder",listOrder);
        model.addAttribute("pages",pages);
        model.addAttribute("id",id);
        model.addAttribute("gName",gName);
        model.addAttribute("sTel",sTel);
        return "lpq/chaxun_lpq";
    }


    //点击订单详情，跳转到订单详情页面
    @RequestMapping(value = "/xiangqing")
    public String getXing(Model model , @RequestParam(value = "id")String id){
        Order_info order_info= courierService.selectOrder_Info(id);
        model.addAttribute("order_info",order_info);
        return "lpq/xiangqing3";
    }

    //点击订单详情页后的修改保存操作
    @RequestMapping(value = "/baoding")
    public String updateOrder_info(Order_info order_info){
        order_info.setRiseTime(new Date());
        order_info.setFinishTime(new Date());
        int result=courierService.updateOrder_info(order_info);
        if(result>0){
            return "redirect:/wuliu/ding";
        }
        return "lpq/xiangqing3";
    }
    //分配订单使用ajax异步处理
    @RequestMapping(value = "fendin")
    @ResponseBody
    public Object fendin(@RequestParam(value = "uid" ,required = false) String uid,
                         @RequestParam(value = "orderid" ,required = false)String orderid,HttpSession session){
        //uid快递员id，orderid订单id，通过session获得网点id
        User user=courierService.getUser(uid);//传入一个快递员id，获得一个快递对象
        /*User user2=(User) session.getAttribute("user");//获得网点id*/
        int result= courierService.updateOrder(Integer.valueOf(uid),
                Integer.valueOf(orderid));
        return user;
    }

    //分配工单使用ajax异步处理
    @RequestMapping(value = "/fen")
    @ResponseBody
    public Object fenUser(@RequestParam(value = "id",required = false)String id,
                          @RequestParam(value = "gid" ,required = false)String gid,
                          HttpSession session){
        System.out.print(id+"\t"+gid+"李普强");
        //id为快递员id，gid为工单id，分配工单后需要更新工单表
        User user=courierService.getUser(id);
        courierService.updateWorkor(Integer.valueOf(id),Integer.valueOf(gid));
        return user;
    }


    //点击确认工单进入工单页面
    @RequestMapping(value = "/gongs")
    public String gongDan(){
        return "redirect:/wuliu/gongdan";
    }
    //确认工单+分页
    @RequestMapping(value = "/gongdan")
    public String selectGong(Model model,
                             Workorder workorder,
                             HttpSession session,
                             @RequestParam(value = "pageIndex" ,required = false)String pageIndex){
        //网点用户
        User user =(User)session.getAttribute("user");

        Integer id =null;
        String  gName=null;//收件人姓名
        String  gTel=null;//收件人手机
        String  sName=null;//发件人姓名
        String  sTel=null;//发件人手机

        if(!StringUtils.isEmpty(workorder.getId())){
            id=Integer.valueOf(workorder.getId());
        }
        if(!StringUtils.isEmpty(workorder.getgName())){
            gName=workorder.getgName();
        }
        if(!StringUtils.isEmpty(workorder.getgTel())){
            gTel=workorder.getgTel();
        }
        if(!StringUtils.isEmpty(workorder.getsName())){
            sName=workorder.getsName();
        }
        if(!StringUtils.isEmpty(workorder.getsTel())){
            sTel=workorder.getsTel();
        }


        Integer pageNum=1;//当前页
        if(pageIndex!=null){
            pageNum=Integer.valueOf(pageIndex);
        }
        String site= courierService.stringSite(user.getParentid());
        //PageHelper工单分页的
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE);//Constants.PAGE_SIZE=5
        List<Workorder> listWorkorder= courierService.selectWor(id, gName, gTel, sName,sTel, site, null, null,
                null, null, null);
        PageInfo<Workorder> pages = new PageInfo<Workorder>(listWorkorder);
        /*  List<User>listUser=courierService.allUser();*/
        model.addAttribute("listWorkorder",listWorkorder);
        model.addAttribute("pages",pages);
        /* model.addAttribute("workorder",workorder);*/
        model.addAttribute("id",id);
        model.addAttribute("gName",gName);
        model.addAttribute("gTel",gTel);
        model.addAttribute("sName",sName);
        model.addAttribute("sTel",sTel);
        return "lpq/gongdan_lpq";
    }

    //确认工单页面点击确认按钮后
    @RequestMapping(value = "que")
    public String getWorkor2(Model model,@RequestParam(value = "id")String id){
        Workorder workorder= courierService.selectWorkor(Integer.valueOf(id));
        model.addAttribute("workorder",workorder);
        return "lpq/querengongdan2";
    }



    //点击分配工单，跳转到分配工单页面
    @RequestMapping(value = "/fengong")
    public String getFen(){
        return "redirect:/wuliu/fengongdan";
    }

    //按条件查询工单情况，并分页
    @RequestMapping(value = "/fengongdan")
    public String selectFen(Model model,
                            @RequestParam(value = "workNum",required = false) String workNum ,
                            @RequestParam(value = "orderNum",required = false) String orderNum ,
                            @RequestParam(value = "gName",required = false) String gName ,
                            @RequestParam(value = "gTel",required = false) String gTel ,
                            @RequestParam(value = "gPoint",required = false) String gPoint ,
                            @RequestParam(value = "workStatus",required = false) Integer workStatus ,
                            @RequestParam(value = "gCourier",required = false) Integer gCourier ,
                            HttpSession session,
                            @RequestParam(value = "pageIndex" ,required = false)String pageIndex){
        User user =(User) session.getAttribute("user");
        String site= courierService.stringSite(user.getParentid());
        Integer pageNum=1;//当前页
        if(pageIndex!=null){
            pageNum=Integer.valueOf(pageIndex);
        }

        //PageHelper工单分页的
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE);//Constants.PAGE_SIZE=5
        List<Workorder> listWorkorder= courierService.selectWor(null, gName, gTel, null, null, site, workNum, orderNum, workStatus, gCourier, gPoint);
        PageInfo<Workorder> pages = new PageInfo<Workorder>(listWorkorder);
        List<User>listUser=courierService.allUser(user.getParentid());

        model.addAttribute("listWorkorder",listWorkorder);
        model.addAttribute("pages",pages);
        model.addAttribute("listUser",listUser);
        model.addAttribute("workNum",workNum);
        model.addAttribute("orderNum",orderNum);
        model.addAttribute("gPoint",gPoint);
        model.addAttribute("workStatus",workStatus);
        model.addAttribute("gCourier",gCourier);
        model.addAttribute("gName",gName);
        model.addAttribute("gTel",gTel);

        return "lpq/fenpei2";
    }

    //点击工单详情，跳转到工单详情页
    @RequestMapping(value = "/gongxiang")
    public String xiang(@RequestParam(value = "id")String id,Model model){
        Workorder workorder= courierService.selectWorkor(Integer.valueOf(id));
        model.addAttribute("workorder",workorder);
        return "lpq/querengongdan2";
    }


    //点击添加员工，跳转到新增员工快递员的页面
    @RequestMapping(value = "/kuai")
    public String addUserKuai(){
        return "lpq/tianjiayuangong2";
    }

    //添加完成后点击保存后的方法，使用了文件上传
    @RequestMapping(value = "/baokuai",method = RequestMethod.POST)
    public String addUserKuai2(User user, BindingResult bindingResult, HttpSession session, HttpServletRequest request,
                               @RequestParam(value = "picPath", required = false) MultipartFile attach){

        String logoPicPath =  null;
        String logoLocPath =  null;
        if(!attach.isEmpty()){
            //原文件路径
            String path = request.getSession().getServletContext().getRealPath("statics"+java.io.File.separator+"uploadfiles");
            //原文件名
            String oldFileName = attach.getOriginalFilename();
            //原文件后缀
            String prefix = FilenameUtils.getExtension(oldFileName);
            int filesize = 500000;
            //上传大小不得超过 50k
            if(attach.getSize() > filesize){
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
                return "redirect:/wuliu/kuai";
            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
                    ||prefix.equalsIgnoreCase("jepg") || prefix.equalsIgnoreCase("pneg")){//上传图片格式
                //图片名
                String fileName = user.getUsername() + ".jpg";//上传LOGO图片命名:apk名称.apk

                File targetFile = new File(path,fileName);
               /* if(!targetFile.exists()){
                    targetFile.mkdirs();//创建文件
                }*/
                try {
                    //保存
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
                    return "redirect:/wuliu/kuai";
                }
                //项目中url路径
                logoPicPath = request.getContextPath()+ "/statics/uploadfiles/"+fileName;
                //服务器的路径
                logoLocPath = /*path+File.separator+*/fileName;
            }else{//为空返回新增页面，并提示信息
                request.setAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
                return "redirect:/wuliu/kuai";
            }
        }

        System.out.print(user.getUsername()+"离谱强");
        user.setPicPath(logoPicPath);
        user.setType(2);
        user.setTime(new Date());
        user.setParentid(((User)session.getAttribute("user")).getParentid());

        int result=courierService.addUserKuai(user);
        if(result>0){
            return "redirect:/wuliu/list";
        }
        return "redirect:/wuliu/kuai";
    }



    //删除员工
    @RequestMapping(value = "shan")
    @ResponseBody
    public Object deleteUser(@RequestParam(value ="uid",required = false) String uid){

        int result=courierService.deleteUser(Integer.valueOf(uid));
        if(result>0){
            return true;
        }
        return false;
    }


    //进入yue月报表页面
    @RequestMapping(value = "/biao")
    public String getBiao(){

        return "lpq/yue";
    }

    //进入jidu季度报表页面
    @RequestMapping(value = "/biao2")
    public String getBiao2(){

        return "lpq/jidu";
    }
    //进入nian年报表页面
    @RequestMapping(value = "/biao3")
    public String getBiao3(){

        return "lpq/nian";
    }

    //查询月度报表方法
    @RequestMapping(value = "yue")
    @ResponseBody
    public Object getYue(){
        List<Integer> result =new ArrayList<Integer>();
        result.add(10);
        result.add(20);
        result.add(30);
        result.add(10);
        result.add(40);
        result.add(70);
        result.add(30);
        result.add(200);
        result.add(50);
        result.add(10);
        result.add(80);
        result.add(90);
        /*List<Integer> result=courierService.selectYueDin();*/
        return result;
    }

    //查询季度报表方法
    @RequestMapping(value = "jidu")
    @ResponseBody
    public Object getJidu(){
        List<Integer> result =new ArrayList<Integer>();
        result.add(110);
        result.add(90);
        result.add(200);
        result.add(300);
        /*List<Integer> result=courierService.selectYueDin();*/
        return result;
    }
    //查询年度报表方法
    @RequestMapping(value = "nian")
    @ResponseBody
    public Object getNian(){
        List<Integer> result =new ArrayList<Integer>();
        result.add(123);
        result.add(343);
        result.add(200);
        result.add(300);
        result.add(400);
        result.add(700);
        result.add(300);
        result.add(200);
        result.add(500);
        result.add(100);
        result.add(800);
        result.add(900);
        /*List<Integer> result=courierService.selectYueDin();*/
        return result;
    }
}
