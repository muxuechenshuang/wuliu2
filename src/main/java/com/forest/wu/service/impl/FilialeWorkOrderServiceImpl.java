package com.forest.wu.service.impl;

import com.forest.wu.dao.WorkorderMapper;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.FilialeWorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 分公司：工单模块service实现类
 *
 * @author 李家和
 * @create 2018-10-05 16:34
 **/
@Service
public class FilialeWorkOrderServiceImpl implements FilialeWorkOrderService {
    @Autowired
    private WorkorderMapper workorderMapper;


    @Override
    public List<Workorder> queryWorkOrderList(Workorder workorder) {
        return workorderMapper.selectWorkOrderByCondition(workorder);
    }

    @Override
    public Workorder queryWorkOrderById(Integer id) {
        return workorderMapper.selectWorkOrderById(id);
    }
}
