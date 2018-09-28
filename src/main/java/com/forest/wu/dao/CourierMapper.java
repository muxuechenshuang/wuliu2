package com.forest.wu.dao;

import com.forest.wu.pojo.Courier;

public interface CourierMapper {
    int deleteByPrimaryKey(Integer employeeNum);

    int insert(Courier record);

    int insertSelective(Courier record);

    Courier selectByPrimaryKey(Integer employeeNum);

    int updateByPrimaryKeySelective(Courier record);

    int updateByPrimaryKey(Courier record);
}