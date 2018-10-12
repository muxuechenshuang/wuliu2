package com.forest.wu.service;

import com.forest.wu.pojo.Organization;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-09-29 16:18
 **/
public interface OrganizationService {

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 16:19 2018/9/29
     * @Param：
     * @return：List<Organization>
     * 查询分公司列表
     */
    public List<Organization> filialeList();

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 11:47 2018/10/2
     * @Param：Integer parentId
     * @return：List<Organization>
     * 通过父Id查询
     */
    public List<Organization> selectByParentId(Integer parentId);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 14:19 2018/10/2
     * @Param：Integer type, Integer parentId
     * @return：int
     * 查询数量  可根据类型或父id查询
     */
    public int getCount(Integer type,Integer parentId);

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 15:25 2018/10/2
     * @Param：Integer parentId, Integer from, Integer pageSize
     * @return：List<Organization>
     * 根据父ID查询（带分页）
     */
    public List<Organization> getBranchList(Integer parentId, Integer currentPageNo, Integer pageSize);


    /**
    * @author: 李家和
    * @Description 根据id查询单个组织对象
    * @Date: 11:43 2018/10/11
    * @Param：[id]
    * @return：com.forest.wu.pojo.Organization
    **/
    public  Organization queryOrganizationById(Integer id);

}
