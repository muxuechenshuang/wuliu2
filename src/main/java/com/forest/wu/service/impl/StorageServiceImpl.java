package com.forest.wu.service.impl;

import com.forest.wu.dao.InstorageMapper;
import com.forest.wu.pojo.Instorage;
import com.forest.wu.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 出入库service层实现类
 *
 * @author 李家和
 * @create 2018-10-09 15:40
 **/
@Service
public class StorageServiceImpl implements StorageService {
    @Autowired
    private InstorageMapper instorageMapper;

    @Override
    public Instorage queryInstorage(Long id) {
        return instorageMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Instorage> queryInstorageList(Instorage instorage) {
        return instorageMapper.selectInstorageList(instorage);
    }

    @Override
    public boolean saveInstorage(Instorage instorage) {
        boolean flag= false;
        if(instorageMapper.insertSelective(instorage)>0){
            flag = true;
        }
        return flag;
    }
}
