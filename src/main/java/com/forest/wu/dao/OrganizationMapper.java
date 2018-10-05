package com.forest.wu.dao;

import com.forest.wu.pojo.Organization;
import com.sun.org.apache.xpath.internal.operations.Or;
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
    * @Description 根据条件查询网点
    * @Date: 14:05 2018/9/29
    * @Param：[id, name, phone]
    * @return：com.forest.wu.pojo.Organization
    **/
    List<Organization> selectByCondition(Organization record);

    /**
    * @author: 李家和
    * @Description 通过id获取Organization
    * @Date: 13:59 2018/10/4
    * @Param：[id]
    * @return：com.forest.wu.pojo.Organization
    **/
    Organization selectOrgnizationById(Integer id);

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
    * @Description 通过条件查询单个网点
    * @Date: 20:47 2018/9/30
    * @Param：[id]
    * @return：com.forest.wu.pojo.Organization
    **/
    Organization selectWd( Organization wd);

    /**
    * @author: 李家和
    * @Description 根据网点id查询该网点的订单数（作为删除网点的条件之一）
    * @Date: 11:14 2018/10/5
    * @Param：[id]
    * @return：int
    **/
    int selectOrderCountByWdId(Integer id);

    /**
    * @author: 李家和
    * @Description 根据网点id查询该网点的快递员数量（作为删除网点的条件之一）
    * @Date: 11:23 2018/10/5
    * @Param：[id]
    * @return：int
    **/
    int selectUserCountByWdId(Integer id);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 16:11 2018/9/29
     * @Param：
     * @return：List<Organization>
     * 查询分公司列表
     */
    List<Organization> filialeList();

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 11:33 2018/10/2
     * @Param：Integer parentId
     * @return：List<Organization>
     * 通过父id查询
     */
    List<Organization> selectByParentId(@Param("parentId") Integer parentId);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 14:04 2018/10/2
     * @Param：Integer type,Integer parentId
     * @return：int
     * 查询数量  可根据类型或父id查询
     */
    int getCount(@Param("type") Integer type,@Param("parentId") Integer parentId);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 15:15 2018/10/2
     * @Param：Integer parentId, Integer from, Integer pageSize
     * @return：List<Organization>
     * 根据父ID查询（带分页）
     */
    List<Organization> getBranchList(@Param("parentId")Integer parentId,@Param("from") Integer from,@Param("pageSize") Integer pageSize);

    /**
    * author: 张展
    * 条件查询分公司列表
    * Date: 9:33 2018/10/2
    * Param：[organization]
    * Return：java.util.List<com.forest.wu.pojo.Organization>
    **/
    List<Organization> selectSonCompany(Organization organization);
    /**
    * author: 张展
    * 通过ID查询分公司（网点也行）
    * Date: 11:47 2018/10/4
    * Param：[id]
    * Return：com.forest.wu.pojo.Organization
    **/
    Organization selectById(Integer id);
    
    /**
    * author: 张展
    * 通过对象更新数据库organization表（分公司网点都行）
    * Date: 11:48 2018/10/4
    * Param：[organization]
    * Return：java.lang.Integer
    **/
    Integer update(Organization organization);
}