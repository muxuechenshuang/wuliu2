package com.forest.wu.service;

import com.forest.wu.pojo.User;

import java.util.List;

/**
 * 用户接口
 *
 * @author 蒋梓伦
 * @create 2018-09-29 9:44
 **/

public interface UserService {
    //登录
    List<User> selectULogin();
    //注册
    int addLogin(User user);
    //检查用户名、手机号和邮箱是否重复
    List<User> findUser();
    //更新个人信息
    int upHome(User user);
}
