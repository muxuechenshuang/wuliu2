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
    User findUser(String username); // 验证用户名
    User findUser1(String email);   // 验证邮箱
    User findUser2(String phone);   // 验证手机号
    //更新个人信息
    int upHome(User user);

    //按ID查找
    User selectByPrimaryKey(Integer id);

    // 删除图片
    boolean deleteAppLogo(Integer id);
}
