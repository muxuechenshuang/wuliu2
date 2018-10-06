package com.forest.wu.service.impl;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.dao.OrganizationMapper;
import com.forest.wu.dao.ReturnMapper;
import com.forest.wu.dao.WorkorderMapper;
import com.forest.wu.pojo.*;
import com.forest.wu.service.CenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 总公司实现类
 *
 * @author 张展
 * @create 2018-09-29 14:42
 **/
@Service
public class CenterServiceImpl implements CenterService {

    @Resource
    private WorkorderMapper workorderMapper;
    @Autowired
    private ReturnMapper returnMapper;
    @Autowired
    private Order_infoMapper order_infoMapper;
    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public List<Workorder> selectWorkOrder(Workorder workorder) throws Exception {
        return workorderMapper.selectWorkOrder(workorder);
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
    public Workorder selectWorkOrdById(Integer id) throws Exception {

        return workorderMapper.selectWorkOrderById(id);
    }

    @Override
    public List<Return> selectReturn(Return returnorder) throws Exception {
        return returnMapper.selectReturn(returnorder);
    }

    @Override
    public Return selectRetrunById(String id) throws Exception {

        return returnMapper.selectByPrimaryKey(id);
    }

    @Override
    public int delectReturn(String id) throws Exception {
        return returnMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateReturn(Return returnorder) throws Exception {
        return returnMapper.updateByPrimaryKeySelective(returnorder);
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
    
    /**
    * author: 张展
    * 添加分公司
    * Date: 15:42 2018/10/3
    * Param：[organization]
    * Return：int
    **/
    @Override
    public int addSonCompany(Organization organization) throws Exception {
        return organizationMapper.insert(organization);
    }

    @Override
    public List<Organization> selectSonCompany(Organization organization) throws Exception {
        List<Organization> list = organizationMapper.selectSonCompany(organization);
        return list;
    }

    @Override
    public Organization selectById(Integer id) throws Exception {
        return organizationMapper.selectById(id);
    }

    @Override
    public int updateSonCompany(Organization organization) throws Exception {
        return organizationMapper.update(organization);
    }

    @Override
    public int delectSonCompany(Integer id) throws Exception {
        return organizationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int addSonCompanyPerson(User user) throws Exception {
        return 0;
    }
}
