package com.forest.wu.dao;

import com.forest.wu.pojo.Product_out;

public interface Product_outMapper {
    int deleteByPrimaryKey(Long outId);

    int insert(Product_out record);

    int insertSelective(Product_out record);

    Product_out selectByPrimaryKey(Long outId);

    int updateByPrimaryKeySelective(Product_out record);

    int updateByPrimaryKey(Product_out record);
}