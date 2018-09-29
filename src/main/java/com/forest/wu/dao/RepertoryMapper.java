package com.forest.wu.dao;

import com.forest.wu.pojo.Repertory;

@Repository
public interface RepertoryMapper {
    int deleteByPrimaryKey(Long storeId);

    int insert(Repertory record);

    int insertSelective(Repertory record);

    Repertory selectByPrimaryKey(Long storeId);

    int updateByPrimaryKeySelective(Repertory record);

    int updateByPrimaryKey(Repertory record);
}