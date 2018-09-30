package com.forest.wu.controller;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.utils.PageSupport;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

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
        PageHelper.startPage(pageIndex, PageSupport.PAGE_SIZE);
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

        PageHelper.startPage(pageIndex, PageSupport.PAGE_SIZE);
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

    /*@RequestMapping("/toorderxianqing")
    public String toOrderXianqing(@RequestParam(value = "orderid",required = false) String orderid,Model model){

        return "xlh/orderxianqian_xlh";
    }
*/

}
