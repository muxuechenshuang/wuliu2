package com.forest.wu.utils;

import com.forest.wu.pojo.Dictionary;
import com.forest.wu.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 数据字典工具类
 *
 * @author 李家和
 * @create 2018-10-06 9:00
 **/

public class DictionaryUtils {
    @Autowired
    private static DictionaryService dictionaryService;

    /**
     * @author: 李家和
     * @Description 获取数据字典
     * @Date: 8:59 2018/10/6
     * @Param：[typeCode]
     * @return：java.util.List<com.forest.wu.pojo.Dictionary>
     **/
    public static List<Dictionary> getDataDictionaryList(String typeCode) {
        List<Dictionary> list = null;
        list = dictionaryService.queryDictionaryList(typeCode);
        return list;
    }
}
