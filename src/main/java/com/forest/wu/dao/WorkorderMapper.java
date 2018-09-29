package com.forest.wu.dao;

import com.forest.wu.pojo.Workorder;

@Repository
public interface WorkorderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Workorder record);

    int insertSelective(Workorder record);

    Workorder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Workorder record);

    int updateByPrimaryKey(Workorder record);
}