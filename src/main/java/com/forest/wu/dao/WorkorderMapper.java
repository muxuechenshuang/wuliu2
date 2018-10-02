package com.forest.wu.dao;

import com.forest.wu.pojo.Workorder;

public interface WorkorderMapper {
    int deleteByPrimaryKey(String id);

    int insert(Workorder record);

    int insertSelective(Workorder record);

    Workorder selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Workorder record);

    int updateByPrimaryKey(Workorder record);
}