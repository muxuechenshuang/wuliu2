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
}
