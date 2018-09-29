package com.forest.wu.service.impl;


import com.forest.wu.dao.UserMapper;
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
    public List<User> selectUsers() {
        return userMapper.selectU();
    }
}
