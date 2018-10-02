package com.forest.wu.service.impl;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.dao.OrganizationMapper;
import com.forest.wu.dao.ReturnMapper;
import com.forest.wu.dao.WorkorderMapper;
import com.forest.wu.pojo.*;
import com.forest.wu.service.CenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 总公司实现类
 *
 * @author 张展
 * @create 2018-09-29 14:42
 **/
@Service
public class CenterServiceImpl implements CenterService {

    @Autowired
    private WorkorderMapper workorderMapper;
    @Autowired
    private ReturnMapper returnMapper;
    @Autowired
    private Order_infoMapper order_infoMapper;
    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public List<Workorder> selectWorkOrder(Workorder workorder) throws Exception {
        return null;
    }

    @Override
    public int delectWorkOrder(Workorder workorder) throws Exception {
        return 0;
    }

    @Override
    public int updateWorkOrder(Workorder workorder) throws Exception {
        return 0;
    }

    @Override
    public List<Workorder> selectReturn(Return returnorder) throws Exception {
        return null;
    }

    @Override
    public int delectReturn(Return returnorder) throws Exception {
        return 0;
    }

    @Override
    public int updateReturn(Return returnorder) throws Exception {
        return 0;
    }

    @Override
    public List<Workorder> selectOrder(Order_info order_info) throws Exception {
        return null;
    }

    @Override
    public int delectOrder(Integer id) throws Exception {
        return 0;
    }

    @Override
    public int updateOrder(Order_info order_info) throws Exception {
        return 0;
    }

    @Override
    public int addSonCompany(Organization organization) throws Exception {
        int i =organizationMapper.insert(organization);
        return i;
    }

    @Override
    public List<Organization> selectSonCompany(Organization organization) throws Exception {
        List<Organization> list = organizationMapper.selectByCondition(organization);
        return list;
    }

    @Override
    public int updateSonCompany(Organization organization) throws Exception {
        return 0;
    }

    @Override
    public int delectSonCompany(Integer id) throws Exception {
        return 0;
    }

    @Override
    public int addSonCompanyPerson(User user) throws Exception {
        return 0;
    }
}
