package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Order_infoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order_info record);

    int insertSelective(Order_info record);

    Order_info selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order_info record);

    int updateByPrimaryKeyWithBLOBs(Order_info record);

    int updateByPrimaryKey(Order_info record);


    /**
     * @author: 肖林辉
     * @Description
     * @Date: 9:20 2018/9/29/029
     * @Param：[order_info]
     * @return：java.util.List<com.forest.wu.pojo.Order_info>
     **/
    List<Order_info> selectAllOrder();



    /**
    * @author: 肖林辉 
    * @Description  根据查询条件查询出对应的订单,没有条件则查全部
    * @Date: 17:00 2018/9/29/029
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/
    List<Order_info> selectSomeOrder(Order_info order);
}