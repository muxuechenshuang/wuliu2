package com.forest.wu.dao;

import com.forest.wu.pojo.Cencompany;

public interface CencompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cencompany record);

    int insertSelective(Cencompany record);

    Cencompany selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cencompany record);

    int updateByPrimaryKey(Cencompany record);
}