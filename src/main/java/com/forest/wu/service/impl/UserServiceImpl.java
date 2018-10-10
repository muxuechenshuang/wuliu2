package com.forest.wu.service.impl;

import com.forest.wu.dao.UserMapper;
import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户实体类
 *
 * @author 蒋梓伦
 * @create 2018-09-29 9:53
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;
    //登录接口实现
    @Override
    public List<User> selectULogin() {
        return mapper.selectULogin();
    }
    //注册接口实现
    @Override
    public int addLogin(User user) {
        return mapper.insertSelective(user);
    }
    //注册用查找接口
    @Override
    public List<User> findUser() {
        return mapper.find();
    }
    //更新用户数据
    @Override
    public int upHome(User user) {
        return mapper.updateByPrimaryKeySelective(user);
    }


}
