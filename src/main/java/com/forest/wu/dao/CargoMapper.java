package com.forest.wu.dao;

import com.forest.wu.pojo.Cargo;

public interface CargoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Cargo record);

    int insertSelective(Cargo record);

    Cargo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Cargo record);

    int updateByPrimaryKey(Cargo record);
}