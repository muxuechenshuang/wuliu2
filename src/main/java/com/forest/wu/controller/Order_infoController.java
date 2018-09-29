package com.forest.wu.controller;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.service.Order_infoService;
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
    public String allOrder(Model model){
        List<Order_info> orderList=orderService.selectAllOrder();
        model.addAttribute("order",orderList);
        return "xlh/dindan_xlh";
    }

    @RequestMapping("/someorder")
    public String someOrder(@RequestParam("order_info")Order_info order, Model model){
        List<Order_info> orderList=orderService.selectSomeOrder(order);
        model.addAttribute("order",orderList);
        return "xlh/dindan_xlh";
    }



}
