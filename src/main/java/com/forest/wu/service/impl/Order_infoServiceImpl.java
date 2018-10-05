package com.forest.wu.service.impl;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.dao.UserMapper;
import com.forest.wu.dao.WorkorderMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
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

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private WorkorderMapper workorderMapper;
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
    public List<Order_info> selectSomeOrder( Order_info order) {
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

    
    /**
    * @author: 肖林辉 
    * @Description   快递员生成初步的工单
    * @Date: 16:08 2018/10/2/002
    * @Param：[workorder]
    * @return：int
    **/
    
    @Override
    public int addWorkorderByCourier(Workorder workorder) {
        return workorderMapper.insert(workorder);
    }
    
    /**
    * @author: 肖林辉 
    * @Description   快递员生成工单后   修改订单的状态  从 1 变为   2
    * @Date: 15:27 2018/10/3/003
    * @Param：[order]
    * @return：int
    **/
    
    @Override
    public int updateOrderStatusByCourier(Order_info order) {
        return orderMapper.updateOrderStatusByCourier(order);
    }


    /**
    * @author: 肖林辉 
    * @Description  查找登录的快递  同一网点下的其它快递员
    * @Date: 15:28 2018/10/3/003
    * @Param：[parentid, id]
    * @return：java.util.List<com.forest.wu.pojo.User>
    **/
    
    @Override
    public List<User> selectCouriersByParentId(int parentid, int id) {
        return userMapper.selectCouriers(parentid,id);
    }

    
    /**
    * @author: 肖林辉 
    * @Description    快递员查询工单  条件 工单状态为1   寄快递员号要等于登录的快递员编号
    * @Date: 10:35 2018/10/4/004
    * @Param：[workorder]
    * @return：java.util.List<com.forest.wu.pojo.Workorder>
    **/
    
    @Override
    public List<Workorder> selectWorkOrderByCourier(Workorder workorder) {
        return workorderMapper.selectWorkOrderByCourier(workorder);
    }


    /**
     *
     * @author: 任一
     * @Description 我要寄单（添加订单）
     * @Date: 8:47 2018/10/5
     * @Param：Order_info
     * @return：boolean
     */
    @Override
    public boolean insertSelective(Order_info order_info) {
        boolean flag = false;
        if(orderMapper.insertSelective(order_info)>0){
            flag = true;
        }
        return flag;
    }
}
