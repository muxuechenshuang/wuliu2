package com.forest.wu.dao;

import com.forest.wu.pojo.Workorder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkorderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Workorder record);

    int insertSelective(Workorder record);

    Workorder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Workorder record);

    int updateByPrimaryKey(Workorder record);



    /**
    * author: 张展
    * （总部）工单查询
    * Date: 14:27 2018/10/2
    * Param：[workorder]
    * Return：com.forest.wu.pojo.Workorder
    **/
    List<Workorder> selectWorkerOrder(Workorder workorder);


}