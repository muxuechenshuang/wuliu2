package com.forest.wu.service;

import com.forest.wu.pojo.User;

/**
 * 用户接口
 *
 * @author 蒋梓伦
 * @create 2018-09-29 9:44
 **/

public interface UserService {
    //登录
    User selectULogin(String user,String password);
    //注册
    int addLogin(User user);
    //检查用户名、手机号和邮箱是否重复
    User findUser(String username);
    User findUser1(String email);
    User findUser2(String phone);

    //更新个人信息
    int upHome(User user);
}
