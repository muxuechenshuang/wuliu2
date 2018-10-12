package com.forest.wu.service;

import com.forest.wu.pojo.Instorage;
import com.forest.wu.pojo.Outstorage;

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
    * @Description 按条件查询查询入库交接单
    * @Date: 15:39 2018/10/9
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Instorage>
    **/
    List<Instorage> queryInstorageList(Instorage instorage);

    Instorage queryInstorage(Long id);

    boolean saveInstorage(Instorage instorage);

    /**
    * @author: 李家和
    * @Description  按条件查询查询出库交接单
    * @Date: 9:51 2018/10/12
    * @Param：[outstorage]
    * @return：java.util.List<com.forest.wu.pojo.Outstorage>
    **/
    List<Outstorage> queryOutstorageList(Outstorage outstorage);

    Outstorage queryOutstorage(Long id);

    boolean saveOutstorage(Outstorage outstorage);

}
