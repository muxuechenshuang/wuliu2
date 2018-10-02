package com.forest.wu.service.impl;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.service.Order_infoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-09-29 10:12
 **/
@Service
public class Order_infoServiceImpl implements Order_infoService {

    @Autowired
    private Order_infoMapper orderMapper;
    /**
    * @author: 肖林辉
    * @Description   查询所有订单
    * @Date: 10:22 2018/9/29/029
    * @Param：[order]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/
    @Override
    public List<Order_info> selectAllOrder() {
        List<Order_info>  orderList = orderMapper.selectAllOrder();
        return orderList;
    }

    /**
    * @author: 肖林辉 
    * @Description 
    * @Date: 9:52 2018/10/2/002
    * @Param：[order]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/
    
    @Override
    public List<Order_info> selectSomeOrder(Order_info order) {
        return orderMapper.selectSomeOrder(order);
    }




    /**
    * @author: 肖林辉 
    * @Description  根据id查询出对应的订单
    * @Date: 10:17 2018/10/2/002
    * @Param：[order]
    * @return：com.forest.wu.pojo.Order_info
    **/

    @Override
    public Order_info selectOneOrder(int id) {
        return orderMapper.selectOneOrderByCourier(id);
    }


}
