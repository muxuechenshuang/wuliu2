package com.forest.wu.dao;

import com.forest.wu.pojo.Instorage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstorageMapper {
    int deleteByPrimaryKey(Long receiptId);

    int insert(Instorage record);

    int insertSelective(Instorage record);

    Instorage selectByPrimaryKey(Long receiptId);

    int updateByPrimaryKeySelective(Instorage record);

    int updateByPrimaryKey(Instorage record);

    /**
    * @author: 李家和
    * @Description 按条件查询已入库的交接单
    * @Date: 15:00 2018/10/9
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Instorage>
    **/
    List<Instorage> selectInstorageList(Instorage instorage);

    Instorage selectByWorkNum(String workorderId);

}