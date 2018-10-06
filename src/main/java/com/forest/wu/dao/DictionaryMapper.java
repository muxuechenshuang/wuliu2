package com.forest.wu.dao;

import com.forest.wu.pojo.Dictionary;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);

    /**
    * @author: 李家和
    * @Description 获取数据字典中的数据
    * @Date: 8:42 2018/10/6
    * @Param：[typeCode]
    * @return：java.util.List<com.forest.wu.pojo.Dictionary>
    **/
    List<Dictionary> selectByTypeCode(String typeCode);
}