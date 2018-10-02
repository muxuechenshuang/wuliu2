package com.forest.wu.controller;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.corba.se.spi.orbutil.threadpool.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;
import java.util.UUID;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-09-29 10:31
 **/
@Controller
@RequestMapping("/order")
public class Order_infoController {
    @Autowired
    private Order_infoService  orderService;

    /**
    * @author: 肖林辉
    * @Description  查询所有
    * @Date: 10:36 2018/9/29/029
    * @Param：[]
    * @return：List<Order_info>
    **/
    @RequestMapping("/allorder")
    public String allOrder(@RequestParam(required = true,defaultValue = "1")Integer pageIndex,Model model){
        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        List<Order_info> orderList=orderService.selectAllOrder();
        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
        model.addAttribute("pageIndex",p);
        model.addAttribute("order",orderList);
        return "xlh/dindan_xlh";
    }
    
    
    /**
    * @author: 肖林辉 
    * @Description   按条件查询,模糊查询
    * @Date: 16:28 2018/9/30/030
    * @Param：[pageIndex, queryOrderNum, querysName, querysTel, order, model]
    * @return：java.lang.String
    **/
    
    @RequestMapping("/someorder")
    public String someOrder(@RequestParam(required = true,defaultValue = "1")Integer pageIndex,
                            @RequestParam(value = "orderNumber",required = false)String queryOrderNum,
                            @RequestParam(value = "sName",required = false)String querysName,
                            @RequestParam(value = "sTel",required = false)String querysTel,
                            Order_info order, Model model){

        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        List<Order_info> orderList=orderService.selectSomeOrder(order);
        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
        model.addAttribute("pageIndex",p);
        model.addAttribute("order",orderList);

        //回显
        model.addAttribute("queryNumber",queryOrderNum);
        model.addAttribute("querysName",querysName);
        model.addAttribute("querysTel",querysTel);

        return "xlh/dindan_xlh";
    }

    /**
    * @author: 肖林辉 
    * @Description  订单页面跳转到订单详情页面
    * @Date: 16:29 2018/9/30/030
    * @Param：
    * @return：
    **/

    @RequestMapping(value = "/toaddgongdan",method = RequestMethod.GET)
    public String toOrderXianqing(@RequestParam(value="id",required = false)int id,Model model){
        //发送订单的信息
        Order_info orderInfo=orderService.selectOneOrder(id);
        model.addAttribute("order",orderInfo);

        //发送工单号
        String workNum=UUID.randomUUID().toString();
        model.addAttribute("workNumber",workNum);

        //发送网点名称

        //快递员编号

        return "xlh/addinfo_xlh";
    }
    
    
    /**
    * @author: 肖林辉 
    * @Description 
    * @Date: 14:36 2018/10/2/002
    * @Param：
    * @return：
    **/
    @RequestMapping("/saveworkorder")
    public void addWorkorder(@RequestParam(value = "id")int id,
                             @RequestParam(value = "workNumber")String workNumber,
                             @RequestParam(value = "realWeight")int  weight,
                             @RequestParam(value = "expenses")int  expenses,
                             @RequestParam(value = "comment")String comment){

       Order_info order = orderService.selectOneOrder(id);
       Workorder workorder = new Workorder();
       workorder.setOrderNum(order.getId().toString());
       workorder.setWorkNum(workNumber);
       workorder.setsName(order.getsName());
       workorder.setsTel(order.getsTel());


    }

}
