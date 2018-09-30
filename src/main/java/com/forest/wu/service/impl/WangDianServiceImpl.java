package com.forest.wu.service.impl;

import com.forest.wu.dao.OrganizationMapper;
import com.forest.wu.pojo.Organization;
import com.forest.wu.service.WangDianService;
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
public class WangDianServiceImpl implements WangDianService {
    @Autowired
    private OrganizationMapper orgMapper;

    @Override
    public List<Organization> getWdListByCondition(Integer id, String name, String phone) throws Exception {
        Organization org = null;
        if (!StringUtils.isEmpty(id)) {
            org.setId(id);
        }
        if (!StringUtils.isEmpty(name)) {
            org.setName(name);
        }
        if (!StringUtils.isEmpty(phone)) {
            org.setPhone(phone);
        }
        return orgMapper.selectByCondition(org);
    }

    @Override
    public boolean modifyWd(Organization wd) throws Exception {
        boolean flag = false;
        if (orgMapper.updateByPrimaryKeySelective(wd) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean delWdById(Integer id) throws Exception {
        boolean flag = false;
        if (orgMapper.deleteByPrimaryKey(id) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean addWd(Organization wd) throws Exception {
        boolean flag = false;
        if (orgMapper.insertSelective(wd) > 0) {
            flag = true;
        }
        return flag;
    }
}
