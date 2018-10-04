package com.forest.wu.dao;

import com.forest.wu.pojo.Dictionary;

import java.util.List;

public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 16:49 2018/10/3
     * @Param：
     * @return：List<Dictionary>
     * 查询货物类型列表
     */
    List<Dictionary> selectGoodsStatus();
}