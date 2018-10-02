package com.forest.wu.service;

import com.forest.wu.pojo.Order_info;
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

    /*
    * @author:李普强
    * @Description描述：通过id查询一个快递员对象
    * @Date: 11:05 2018/9/30
    * @Param参数：id
    * @return返回值：快递员对象
    **/
     User  getUser(String id);

     /*
     * @author:李普强
     * @Description描述：修改一个快递员信息
     * @Date: 11:23 2018/9/30
     * @Param参数：快递员对象
     * @return返回值：int
     **/
    int updateUser(User user);

    /*
    * @author:李普强
    * @Description描述：模糊查询，查询相对应的订单，条件：订单号，寄件人姓名，手机号，订单状态
    * @Date: 15:34 2018/9/30
    * @Param参数：order_info对象，分页参数
    * @return返回值：order_info订单对象集合
    **/

    List<Order_info> selectOrder(Integer id, String gName,String sTel,Integer status);


    /*
    * @author:李普强
    * @Description描述：通过订单id查询出一个订单对象
    * @Date: 9:53 2018/10/2
    * @Param参数：id
    * @return返回值：订单对象order
    **/
    Order_info selectOrder_Info(String id);


    /*
    * @author:李普强
    * @Description描述：保存修改后的订单信息
    * @Date: 11:08 2018/10/2
    * @Param参数：订单对象order_info
    * @return返回值：int
    **/
    int updateOrder_info(Order_info order_info);
}
