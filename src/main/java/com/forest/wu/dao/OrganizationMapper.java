package com.forest.wu.dao;

import com.forest.wu.pojo.Organization;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author: 李家和
* @Description 组织接口类
* @Date: 10:57 2018/9/29
* @Param：
* @return：
**/
@Repository
public interface OrganizationMapper {



    /**
    * @author: 李家和
    * @Description 通过id删除网点，分公司
    * @Date: 10:58 2018/9/29
    * @Param：[id]
    * @return：int
    **/
    int deleteByPrimaryKey(Integer id);

    /**
    * @author: 李家和
    * @Description  新增网点，分公司
    * @Date: 10:58 2018/9/29
    * @Param：[record]
    * @return：int
    **/
    int insert(Organization record);

    int insertSelective(Organization record);

    /**
    * @author: 李家和
    * @Description 根据条件查询网点，分公司
    * @Date: 14:05 2018/9/29
    * @Param：[id, name, phone]
    * @return：com.forest.wu.pojo.Organization
    **/
    List<Organization> selectByCondition(Organization record);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);
}