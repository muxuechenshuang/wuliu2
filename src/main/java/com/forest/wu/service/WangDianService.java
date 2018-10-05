package com.forest.wu.service;

import com.forest.wu.pojo.Organization;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.List;

/**
 * @author: 李家和
 * @Description 网点业务层接口
 * @Date: 14:47 2018/9/29
 * @Param：
 * @return：
 **/
public interface WangDianService {

    public List<Organization> getWdListByCondition(Integer id, String name, String phone,Integer parentId) ;

    public boolean modifyWd(Organization wd) ;

    public boolean delWdById(Integer id)  ;

    public boolean addWd(Organization wd)  ;

    public int getWdCount() ;

    public Organization getWd(Organization wd);

    public Organization getSonCompanyById(Integer id);

    public int getOrderCountByWdId(Integer id);

    public int  getUserCountByWdId(Integer id);
}
