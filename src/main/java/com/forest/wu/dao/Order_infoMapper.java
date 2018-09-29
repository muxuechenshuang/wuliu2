package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;

import java.util.List;

public interface Order_infoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order_info record);

    int insertSelective(Order_info record);

    Order_info selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order_info record);

    int updateByPrimaryKey(Order_info record);

    /**
    * @author: 肖林辉
    * @Description   根据查询条件查询出对应的订单
    * @Date: 9:20 2018/9/29/029
    * @Param：[order_info]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/
    List<Order_info> selectOrderByOption(Order_info order);


}