package com.forest.wu.service;

import com.forest.wu.pojo.Organization;

import java.util.List;

/**
 * @author: 李家和
 * @Description 网点业务层接口
 * @Date: 14:47 2018/9/29
 * @Param：
 * @return：
 **/
public interface WangDianService {

    public List<Organization> getWdListByCondition(Integer id, String name, String phone) ;

    public boolean modifyWd(Organization wd) ;

    public boolean delWdById(Integer id)  ;

    public boolean addWd(Organization wd)  ;

    public int getWdCount() ;

    public Organization getWdById(Integer id);
}
