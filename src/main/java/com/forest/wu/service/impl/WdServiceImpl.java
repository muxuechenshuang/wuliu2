package com.forest.wu.service.impl;

import com.forest.wu.dao.OrganizationMapper;
import com.forest.wu.pojo.Organization;
import com.forest.wu.service.WdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 网点业务层接口实现类
 *
 * @author 李家和
 * @create 2018-09-29 14:57
 **/
@Service
public class WdServiceImpl implements WdService {


    @Autowired
    private OrganizationMapper orgMapper;

    @Override
    public List<Organization> getWdListByCondition(Integer id, String name, String phone,Integer parentId)   {
        Organization org = new Organization();
        if (!StringUtils.isEmpty(id)) {
            org.setId(id);
        }
        if (!StringUtils.isEmpty(name)) {
            org.setName(name);
        }
        if (!StringUtils.isEmpty(phone)) {
            org.setPhone(phone);
        }
        if (!StringUtils.isEmpty(parentId)) {
            org.setParentId(parentId);
        }
        return orgMapper.selectByCondition(org);
    }

    @Override
    public boolean modifyWd(Organization wd)   {
        boolean flag = false;
        if (orgMapper.updateByPrimaryKeySelective(wd) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean delWdById(Integer id)   {
        boolean flag = false;
        if (orgMapper.deleteByPrimaryKey(id) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public int getOrderCountByWdId(Integer id) {
        return orgMapper.selectOrderCountByWdId(id);
    }

    @Override
    public int getUserCountByWdId(Integer id) {
        return orgMapper.selectUserCountByWdId(id);
    }

    @Override
    public boolean addWd(Organization wd)   {
        boolean flag = false;
        if (orgMapper.insertSelective(wd) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public int getWdCount()   {
        return orgMapper.selectWdCount();
    }

    @Override
    public Organization getWd(Organization organization) {
        return orgMapper.selectWd(organization);
    }

    @Override
    public Organization getSonCompanyById(Integer id) {
        return orgMapper.selectOrgnizationById(id);
    }
}
