package com.forest.wu.dao;

import com.forest.wu.pojo.Uesr;

public interface UesrMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Uesr record);

    int insertSelective(Uesr record);

    Uesr selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Uesr record);

    int updateByPrimaryKey(Uesr record);
}