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

    @Override
    public List<User> selectULogin() {
        return mapper.selectULogin();
    }

    @Override
    public User selectUserAll(String user, String password) {
        return mapper.selectUser(user,password);
    }


}
