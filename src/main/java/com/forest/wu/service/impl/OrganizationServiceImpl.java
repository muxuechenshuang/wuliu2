package com.forest.wu.service.impl;

import com.forest.wu.dao.OrganizationMapper;
import com.forest.wu.pojo.Organization;
import com.forest.wu.service.OrganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-09-29 16:20
 **/
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Resource
    private OrganizationMapper organizationMapper;

    /**
     * @author: 任一
     * @Description
     * @Date: 16:23 2018/9/29
     */
    @Override
    public List<Organization> filialeList() {
        return organizationMapper.filialeList();
    }

    @Override
    public List<Organization> selectByParentId(Integer parentId) {
        return organizationMapper.selectByParentId(parentId);
    }

    @Override
    public int getCount(Integer type, Integer parentId) {
        return organizationMapper.getCount(type, parentId);
    }

    @Override
    public List<Organization> getBranchList(Integer parentId, Integer currentPageNo, Integer pageSize) {
        return organizationMapper.getBranchList(parentId, (currentPageNo - 1) * pageSize, pageSize);
    }
}
