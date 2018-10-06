package com.forest.wu.service.impl;

import com.forest.wu.dao.DictionaryMapper;
import com.forest.wu.pojo.Dictionary;
import com.forest.wu.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: 李家和
 * @Description 数据字典业务层实现类
 * @Date: 8:53 2018/10/6
 * @Param：
 * @return：
 **/
@Service
public class DictionaryServiceImpl implements DictionaryService {
    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Override
    public List<Dictionary> queryDictionaryList(String typeCode) {
        return dictionaryMapper.selectByTypeCode(typeCode);
    }
}
