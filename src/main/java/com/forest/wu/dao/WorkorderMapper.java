package com.forest.wu.dao;

import com.forest.wu.pojo.Dictionary;
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
    List<Workorder> selectWorkOrder(Workorder workorder);
    
    /**
    * author: 张展
    * 根据工单ID查询工单
    * Date: 11:18 2018/10/3
    * Param：[id]
    * Return：com.forest.wu.pojo.Workorder
    **/
    public Workorder selectWorkOrderById(Integer id)  ;


    /**
    * @author: 李家和
    * @Description 分公司工单查询
    * @Date: 16:03 2018/10/5
    * @Param：[workorder]
    * @return：java.util.List<com.forest.wu.pojo.Workorder>
    **/
    public List<Workorder> selectWorkOrderByCondition(Workorder workorder);

    public List<Dictionary> selectWorkOrderStatusList();


    /**
     * @author: 肖林辉
     * @Description   快递员查询工单  条件 工单状态为1   寄快递员号要等于登录的快递员编号
     * @Date: 10:29 2018/10/4/004
     * @Param：[workorder]
     * @return：java.util.List<com.forest.wu.pojo.Workorder>
     **/

    public List<Workorder> selectWorkOrderByCourier(Workorder workorder);

}