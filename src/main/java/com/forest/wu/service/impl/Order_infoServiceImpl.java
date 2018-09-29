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
    * @Description   按条件查询订单
    * @Date: 10:22 2018/9/29/029
    * @Param：[order]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/
    @Override
    public List<Order_info> selectAllOrder() {
        List<Order_info>  orderList = orderMapper.selectAll();
        return orderList;
    }
}
