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
     /*
     * @author:李普强
     * @Description描述：查询快递员
     * @Date: 14:29 2018/9/29
     * @Param参数：
     * @return返回值：快递员集合
     **/
    List<User> selectUsers(String id,String username,String phone,String email,
                           Integer pageNo,Integer pageSize);


    /*
    * @author:李普强
    * @Description描述：根据条件查询总记录数
    * @Date: 14:53 2018/9/29
    * @Param参数：用户编号，用户姓名，手机，邮箱
    * @return返回值：int
    **/
    int count(String id,String username,String phone,String email);

}
