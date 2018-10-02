package com.forest.wu.controller;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.Organization;
import com.forest.wu.pojo.User;
import com.forest.wu.service.CourierService;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
        return  "lpq/yuangong2";
    }
    //点击跳转到查询订单信息页面
    @RequestMapping(value = "/dingdan")
     public String dingDanYe(){
        return "lpq/chaxun_lpq";
    }

    //员工管理页面，条件查询，分页展示快递员信息
    @RequestMapping(value = "/list")
    public String selectUser(Model model, @RequestParam(value = "id",required = false) String id,
                             @RequestParam(value = "username",required = false) String username,
                             @RequestParam(value = "phone",required = false) String phone,
                             @RequestParam(value = "email" ,required = false) String email,
                             @RequestParam(value = "pageIndex",required = false) String pageIndex){
        Integer pageNo=1;//当前页
        Integer pageSize=3;//页大小
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
        count=courierService.count(id, username, phone, email);


        //创建page分页对象
        Page page=new Page();
        page.setPageSize(pageSize);
        page.setCount(count);
        int pageCount=page.getPageCount();
        //控制首尾页
        if(pageNo<1){
            pageNo=1;
        }else if(pageNo>pageCount){
            pageNo=pageCount;
        }
        page.setPageNo(pageNo);//控制首尾页之后再设置当前页pageNo


        Integer pageNos=(pageNo-1)*pageSize;
        //快递员对象集合
        List<User> listUser= courierService.selectUsers(id,username,phone,email,pageNos,pageSize);
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


    //按条件查询订单信息，并分页显示
    @RequestMapping(value = "/ding")
    public String selectOrder(Model model,
                              Order_info order_info,
                              @RequestParam(value = "pageIndex" ,required = false)String pageIndex){

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
        List<Order_info> listOrder= courierService.selectOrder(id, gName, sTel,status);
        PageInfo<Order_info> pages = new PageInfo<Order_info>(listOrder);


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
        return "xiangqing3";
    }

    //点击订单详情页后的修改保存操作
    @RequestMapping(value = "/baoding")
    public String updateOrder_info(Order_info order_info){
        order_info.setRiseTime(new Date());
        int result=courierService.updateOrder_info(order_info);
        if(result>0){
            return "redirect:/wuliu/ding";
        }
        return "xiangqing3";
    }
}
