package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import javafx.scene.chart.ValueAxis;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    /*
    * @author: 蒋梓伦
    * @Date: 9:41 2018/9/29
    * 查询用户登录信息
    **/
    List<User> selectULogin();

    /*
    * @author:李普强
    * @Description描述：用户输入的条件查询出对应的快递员信息，并分页
    * @Date: 10:24 2018/9/29
    * @Param参数：快递员编号 ，名字，手机，邮箱，当前页，页大小
    * @return返回值：快递员对象集合
    **/
    List<User> selectUser(@Param(value = "id") String id,
                          @Param(value = "username") String username,
                          @Param(value = "phone") String phone,
                          @Param(value = "email") String email,
                          @Param(value = "pageNo") Integer pageNo,
                          @Param(value = "pageSize") Integer pageSize);
    /*
    * @author:李普强
    * @Description描述：根据条件查询对应快递员的count记录数
    * @Date: 16:20 2018/9/29
    * @Param参数：快递员编号，名字，手机，邮箱
    * @return返回值：int
    **/
    public int count(@Param(value = "id") String id ,
                     @Param(value = "username") String username,
                     @Param(value = "phone") String phone,
                     @Param(value = "email") String email);

    /*
    * @author:李普强
    * @Description描述：通过id查询出一个快递对象
    * @Date: 11:10 2018/9/30
    * @Param参数：id
    * @return返回值：快递员对象
    **/
    public User getUser(@Param(value = "id") String id);


    /*
    * @author:李普强
    * @Description描述：修改一个快递员信息
    * @Date: 11:25 2018/9/30
    * @Param参数：快递员对象
    * @return返回值：int
    **/
    int updateUser(User user);



    /*
    * @author:李普强
    * @Description描述：模糊查询，查询订单对象集合
    * @Date: 15:38 2018/9/30
    * @Param参数：订单对象order_info
    * @return返回值：订单对象集合
    **/
    List<Order_info> selectOrder(@Param(value = "id") Integer id,
                                 @Param(value = "gName") String gName,
                                 @Param(value = "sTel") String sTel,
                                 @Param(value = "status") Integer status);

    /*
    * @author:李普强
    * @Description描述：通过订单id查询一个订单对象，用于页面的单个订单展示
    * @Date: 9:56 2018/10/2
    * @Param参数：订单id
    * @return返回值：订单对象order
    **/
    Order_info selectOrder_Info(@Param(value = "id")String id);

    /*
    * @author:李普强
    * @Description描述：保存修改后的订单对象
    * @Date: 11:09 2018/10/2
    * @Param参数：订单对象order_info
    * @return返回值：int
    **/
    int updateOrder_info(Order_info order_info);
}