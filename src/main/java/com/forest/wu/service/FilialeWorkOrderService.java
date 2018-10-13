package com.forest.wu.service;

import com.forest.wu.pojo.Workorder;

import java.util.List;

/**
 * @author: 李家和
 * @Description 分公司：工单模块service接口
 * @Date: 16:30 2018/10/5
 * @Param：
 * @return：
 **/
public interface FilialeWorkOrderService {
    List<Workorder> queryWorkOrderList(Workorder workorder);

    Workorder queryWorkOrderById(Integer id);

    /**
     * @author: 李家和
     * @Description 查询所有待入库的工单
     * @Date: 10:58 2018/10/9
     * @Param：[]
     * @return：java.util.List<com.forest.wu.pojo.Workorder>
     **/
    List<Workorder> queryReadyInStorageWorkOrderList(Integer filialeId);


    /**
     * @author: 李家和
     * @Description 查询所有已入库待出库的工单
     * @Date: 10:59 2018/10/9
     * @Param：[]
     * @return：java.util.List<com.forest.wu.pojo.Workorder>
     **/
    List<Workorder> queryReadyOutStorageWorkOrderList(Integer filialeId);

    /**
     * @author: 李家和
     * @Description 根据工单号查询工单
     * @Date: 10:01 2018/10/11
     * @Param：[]
     * @return：com.forest.wu.pojo.Workorder
     **/
    Workorder queryWorkOrderByWorkNum(String workNum);

    /**
     * @author: 李家和
     * @Description 保存修改工单
     * @Date: 10:27 2018/10/11
     * @Param：[workorder]
     * @return：boolean
     **/
    boolean saveWorkOrder(Workorder workorder);


}
