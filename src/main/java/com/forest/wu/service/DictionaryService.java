package com.forest.wu.service;

import com.forest.wu.pojo.Dictionary;

import java.util.List;

/**
 * @author: 李家和
 * @Description 数据字典业务层接口
 * @Date: 8:50 2018/10/6
 * @Param：
 * @return：
 **/
public interface DictionaryService {
    public List<Dictionary> queryDictionaryList(String typeCode);

    List<Dictionary> selectGoodsStatus();
}
