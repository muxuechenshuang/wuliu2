package com.forest.wu.dao;

import com.forest.wu.pojo.Return;
import org.springframework.stereotype.Repository;

@Repository
public interface ReturnMapper {
    int deleteByPrimaryKey(String id);

    int insert(Return record);

    int insertSelective(Return record);

    Return selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Return record);

    int updateByPrimaryKey(Return record);
}