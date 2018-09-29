package com.forest.wu.service;

import com.forest.wu.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户
 *
 * @author 李普强
 * @create 2018-09-29 10:04
 **/

public interface CourierService {

    List<User> selectUsers();


}
