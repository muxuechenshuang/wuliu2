package com.forest.wu.dao;

import com.forest.wu.pojo.Soncompany;

public interface SoncompanyMapper {
    int insert(Soncompany record);

    int insertSelective(Soncompany record);
}