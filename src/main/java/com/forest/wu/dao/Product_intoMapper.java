package com.forest.wu.dao;

import com.forest.wu.pojo.Product_into;

@Repository
public interface Product_intoMapper {
    int deleteByPrimaryKey(Long receiptId);

    int insert(Product_into record);

    int insertSelective(Product_into record);

    Product_into selectByPrimaryKey(Long receiptId);

    int updateByPrimaryKeySelective(Product_into record);

    int updateByPrimaryKey(Product_into record);
}