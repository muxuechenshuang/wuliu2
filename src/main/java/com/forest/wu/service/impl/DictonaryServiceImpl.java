package com.forest.wu.service.impl;

import com.forest.wu.dao.DictionaryMapper;
import com.forest.wu.pojo.Dictionary;
import com.forest.wu.service.DictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-10-03 17:00
 **/
@Service
public class DictonaryServiceImpl implements DictionaryService {

    @Resource
    private DictionaryMapper dictionaryMapper;

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 17:01 2018/10/3
     * @Param：
     * @return：List<Dictionary>
     * 查询货物类型列表
     */
    @Override
    public List<Dictionary> selectGoodsStatus() {
        return dictionaryMapper.selectGoodsStatus();
    }
}
