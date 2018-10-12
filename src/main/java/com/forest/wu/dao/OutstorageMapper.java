package com.forest.wu.dao;

import com.forest.wu.pojo.Outstorage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OutstorageMapper {
    int deleteByPrimaryKey(Long outId);

    int insert(Outstorage record);

    int insertSelective(Outstorage record);

    Outstorage selectByPrimaryKey(Long outId);

    int updateByPrimaryKeySelective(Outstorage record);

    int updateByPrimaryKey(Outstorage record);

    List<Outstorage> selectOutstorageList(Outstorage outstorage);
}