package com.forest.wu.dao;

import com.forest.wu.pojo.Userfunction;

@Repository
public interface UserfunctionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Userfunction record);

    int insertSelective(Userfunction record);

    Userfunction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Userfunction record);

    int updateByPrimaryKey(Userfunction record);
}