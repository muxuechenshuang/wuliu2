package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;

public interface Order_infoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order_info record);

    int insertSelective(Order_info record);

    Order_info selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order_info record);

    int updateByPrimaryKey(Order_info record);
}