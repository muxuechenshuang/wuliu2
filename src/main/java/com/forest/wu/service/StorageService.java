package com.forest.wu.service;

import com.forest.wu.pojo.Instorage;

import java.util.List;

/**
* @author: 李家和
* @Description 出入库service层接口
* @Date: 15:37 2018/10/9
* @Param：
* @return：
**/
public interface StorageService {

    /**
    * @author: 李家和
    * @Description 按条件查询查询已入库的交接单
    * @Date: 15:39 2018/10/9
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Instorage>
    **/
    List<Instorage> queryInstorageList(Instorage instorage);

    Instorage queryInstorage(Long id);

    boolean saveInstorage(Instorage instorage);

}
