package com.forest.wu.dao;

import com.forest.wu.pojo.Outstorage;

public interface OutstorageMapper {
    int deleteByPrimaryKey(Integer outId);

    int insert(Outstorage record);

    int insertSelective(Outstorage record);

    Outstorage selectByPrimaryKey(Integer outId);

    int updateByPrimaryKeySelective(Outstorage record);

    int updateByPrimaryKey(Outstorage record);
}