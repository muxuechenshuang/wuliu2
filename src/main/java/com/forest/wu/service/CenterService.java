package com.forest.wu.service;

import com.forest.wu.pojo.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 总公司Service
 *
 * @author 张展
 * @create 2018-09-29 10:20
 **/

@Repository
public interface CenterService {

    //工单部分
    /*
    * @author: 张展
    * 工单查询
    * @Date: 14:34 2018/9/29
    * @Param：[workorder]
    * @Return：java.util.List<com.forest.wu.pojo.Workorder>
    **/
    public List<Workorder> selectWorkOrder(Workorder workorder) throws Exception;


    /*
    * @author: 张展
    * 工单删除
    * @Date: 14:34 2018/9/29
    * @Param：[workorder]
    * @Return：int
    **/
    public int delectWorkOrder(Workorder workorder) throws Exception;

    /*
    * @author: 张展
    * 
    * @Date: 14:35 2018/9/29
    * @Param：[workorder]
    * @Return：int
    **/
    public int updateWorkOrder(Workorder workorder) throws Exception;

    public Workorder selectWorkOrdById(Integer id) throws Exception;


    //返货单部分

    public List<Return> selectReturn(Return returnorder) throws Exception;

    public Return selectRetrunById(String id) throws Exception;

    public int delectReturn(String id) throws Exception;


    public int updateReturn(Return returnorder) throws Exception;


    //订单部分

    public List<Workorder> selectOrder(Order_info order_info) throws Exception;

    
    public int delectOrder(Integer id) throws Exception;


    public int updateOrder(Order_info order_info) throws Exception;


    //分公司相关
    public int addSonCompany(Organization organization) throws Exception;

    public List<Organization> selectSonCompany(Organization organization) throws Exception;

    public Organization selectById(Integer id) throws Exception;

    public int updateSonCompany(Organization organization) throws Exception;

    public int delectSonCompany(Integer id) throws Exception;

    //新增分公司操作员
    public int addSonCompanyPerson(User user)throws Exception;

    public List<User> selectCompanyPerson(User user) throws Exception;

    public int delectSonCompanyPerson(Integer id)throws Exception;

    public User selectByUserId(Integer id)throws Exception;

    public Integer updateUserById(User user)throws Exception;
    
}
