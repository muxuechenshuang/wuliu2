package com.forest.wu.service;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;

import java.util.List;

/**
 * 网点
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
    List<User> selectUsers(String id, String username, String phone, String email,
                           Integer pageNo, Integer pageSize, Integer type, Integer parentid);


    /*
     * @author:李普强
     * @Description描述：根据条件查询总记录数
     * @Date: 14:53 2018/9/29
     * @Param参数：用户编号，用户姓名，手机，邮箱
     * @return返回值：int
     **/
    int count(String id, String username, String phone, String email, Integer type, Integer parentid);

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

    List<Order_info> selectOrder(Integer id, String gName, String sTel, Integer status, Integer parentid);


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



    /*
     * @author:李普强
     * @Description描述：查询所有快递员
     * @Date: 15:45 2018/10/2
     * @Param参数：无
     * @return返回值：快递员对象集合
     **/
    List<User> allUser(Integer parentid);


    /*
     * @author:李普强
     * @Description描述：条件查询查询工单
     * @Date: 10:00 2018/10/3
     * @Param参数：工单号，寄件人姓名，手机，收件人姓名.手机
     * @return返回值：工单对象集合
     **/
    List<Workorder> selectWor(Integer id,
                              String gName,
                              String gTel,
                              String sName,
                              String sTel,
                              String site,
                              String workNum,
                              String orderNum,
                              Integer workStatus,
                              Integer gCourier,
                              String gPoint);







    /*
     * @author:李普强
     * @Description描述：通过工单id查询出一个工单对象
     *
     * @Date: 15:47 2018/10/3
     * @Param参数：id
     * @return返回值：工单对象
     **/
    Workorder selectWorkor(Integer id);


    /*
     * @author:李普强
     * @Description描述：通过parentid查询出一个组织表中的地址
     * @Date: 19:04 2018/10/4
     * @Param参数：parentid
     * @return返回值：String 地址字符串
     **/
    String stringSite(Integer parentid);


    /*
    * @author:李普强
    * @Description描述：新增一个快递员
    * @Date: 14:00 2018/10/6
    * @Param参数：快递员对象
    * @return返回值：int
    **/
    int addUserKuai(User user);


    /*
    * @author:李普强
    * @Description描述：根据id删除一个快递员对象
    * @Date: 9:46 2018/10/8
    * @Param参数：uid
    * @return返回值：int
    **/
    int deleteUser(Integer uid);


    /*
    * @author:李普强
    * @Description描述：点击分配订单后，将订单表中的寄件人网点id和快递员id添加到订单表中
    * @Date: 11:11 2018/10/8
    * @Param参数：快递员id和网点id
    * @return返回值：int
    *
    **/
    int updateOrder(Integer uid, Integer orderid);


    /*
    * @author:李普强
    * @Description描述：分配工单后更新工单表的快递员一栏信息
    * @Date: 15:52 2018/10/8
    * @Param参数：工单id，快递员id
    * @return返回值：int
    **/
    int updateWorkor(Integer id, Integer gid);

    /*
    * @author:李普强
    * @Description描述：查询一个月的订单条数
    * @Date: 15:26 2018/10/11
    * @Param参数：无参
    * @return返回值：Int
    **/
    List<Integer> selectYueDin();
}
