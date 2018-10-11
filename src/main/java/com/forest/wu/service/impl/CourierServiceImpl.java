package com.forest.wu.service.impl;


import com.forest.wu.dao.UserMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.CourierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户实现类
 *
 * @author 李普强
 * @create 2018-09-29 10:06
 **/
@Service
public class CourierServiceImpl implements CourierService {
    @Autowired
    private UserMapper userMapper;


    //快递员的模糊查询加分页条件
    @Override
    public List<User> selectUsers(String id, String username, String phone, String email, Integer pageNo, Integer pageSize,Integer type,Integer parentid) {
        return userMapper.selectUsers(id,username,phone,email,pageNo,pageSize,type,parentid);
    }

    //通过条件查询出快递员的总记录数
    @Override
    public int count(String id, String username, String phone, String email,Integer type,Integer parentid) {

        return userMapper.count(id,username,phone,email,type,parentid);
    }
    //通过id查询一个快递员
    @Override
    public User getUser(String id) {
        return userMapper.getUser(id);
    }

    //更新一个快递员信息
    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    //模糊查询出订单对象集合
    @Override
    public List<Order_info> selectOrder(Integer id, String gName, String sTel, Integer status,Integer parentid) {
        return userMapper.selectOrder(id,gName, sTel, status,parentid);
    }
    //通过id查询一个订单对象
    @Override
    public Order_info selectOrder_Info(String id) {
        return userMapper.selectOrder_Info(id);
    }

    //修改一个订单对象，返回int
    @Override
    public int updateOrder_info(Order_info order_info) {
        return userMapper.updateOrder_info(order_info);
    }

    //查询所有快递员
    @Override
    public List<User> allUser(Integer parentid) {
        return userMapper.allUser(parentid);
    }

    //条件查询工单对象集合
    @Override
    public List<Workorder> selectWor(Integer id,
                                     String gName,
                                     String gTel,
                                     String sName,
                                     String sTel,
                                     String site,
                                     String workNum,
                                     String  orderNum,
                                     Integer workStatus,
                                     Integer gCourier,
                                     String gPoint) {
        return userMapper.selectWor(id, gName, gTel, sName, sTel, site, workNum, orderNum, workStatus, gCourier, gPoint);
    }




    //通过id查询一个工单对象
    @Override
    public Workorder selectWorkor(Integer id) {
        return userMapper.selectWorkor(id);
    }

    @Override
    public String stringSite(Integer parentid) {
        return userMapper.stringSite(parentid);
    }

    @Override
    public int addUserKuai(User user) {
        return userMapper.addUserKuai(user);
    }

    @Override
    public int deleteUser(Integer uid) {
        return userMapper.deleteUser(uid);
    }

    @Override
    public int updateOrder(Integer uid, Integer orderid) {
        return userMapper.updateOrder(uid, orderid);
    }

    @Override
    public int updateWorkor(Integer id, Integer gid) {
        return userMapper.updateWorkor(id, gid);
    }


}
