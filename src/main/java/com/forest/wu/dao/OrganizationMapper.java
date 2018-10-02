package com.forest.wu.dao;

import com.forest.wu.pojo.Organization;
import org.apache.ibatis.annotations.Param;
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

    /**
    * @author: 李家和
    * @Description 查询网点总数量
    * @Date: 16:43 2018/9/30
    * @Param：[]
    * @return：int
    **/
    int selectWdCount();

    /**
    * @author: 李家和
    * @Description 通过id查询单个网点
    * @Date: 20:47 2018/9/30
    * @Param：[id]
    * @return：com.forest.wu.pojo.Organization
    **/
    Organization selectWdById( Integer id);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 16:11 2018/9/29
     * @Param：
     * @return：List<String>
     * 查询设有分公司的城市列表
     */
    List<String> cityList();

    /**
    * author: 张展
    * 条件查询分公司列表
    * Date: 9:33 2018/10/2
    * Param：[organization]
    * Return：java.util.List<com.forest.wu.pojo.Organization>
    **/
    List<Organization> selectSonCompany(Organization organization);
}