package com.forest.wu.service;

import com.forest.wu.pojo.Order_info;

import java.util.List;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-09-29 10:10
 **/
public interface Order_infoService {
    /**
    * @author: 肖林辉
    * @Description  查询所有的订单
    * @Date: 10:20 2018/9/29/029
    * @Param：
    * @return：
    **/
    List<Order_info>  selectAllOrder();




    /**
    * @author: 肖林辉
    * @Description  模糊查询订单  根据快递员的编号
    * @Date: 17:03 2018/9/29/029
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/

    List<Order_info>  selectSomeOrder(Order_info order);



}