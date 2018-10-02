package com.forest.wu.service.impl;


import com.forest.wu.dao.UserMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
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



    @Override
    public List<User> selectUsers(String id, String username, String phone, String email, Integer pageNo, Integer pageSize) {
        return userMapper.selectUser(id,username,phone,email,pageNo,pageSize);
    }


    @Override
    public int count(String id, String username, String phone, String email) {

        return userMapper.count(id,username,phone,email);
    }

    @Override
    public User getUser(String id) {
        return userMapper.getUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public List<Order_info> selectOrder(Integer id, String gName, String sTel, Integer status) {
        return userMapper.selectOrder(id,gName, sTel, status);
    }

    @Override
    public Order_info selectOrder_Info(String id) {
        return userMapper.selectOrder_Info(id);
    }

    @Override
    public int updateOrder_info(Order_info order_info) {
        return userMapper.updateOrder_info(order_info);
    }


}
