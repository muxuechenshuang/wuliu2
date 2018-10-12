package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserMapper {
    /**
    * author: 张展
    * 根据ID删除某个用户对象
    * Date: 14:45 2018/10/8
    * Param：[id]
    * Return：int
    **/
    int deleteByPrimaryKey(Integer id);

    int insert(User record);
    /*
     * @author: 蒋梓伦
     * @Date: 10:33 2018/10/2
     * 注册，往数据库中添加数据
     **/
    int insertSelective(User user);
    /*
    * @author: 蒋梓伦
    * @Description
    * @Date: 15:17 2018/10/9
    * @Param：[id]
    * @return：根据Id查找数据
    **/
    User selectByPrimaryKey(Integer id);
    /*
    * @author: 蒋梓伦
    * @Description
    * @Date: 19:50 2018/10/8
    * @Param：更新用户数据
    * @return：int
    **/
    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User record);
    /*
    * @author: 蒋梓伦
    * @Date: 9:41 2018/9/29
    * 查询用户登录信息
    **/
    User selectULogin(String user,String password);

    /*
    * @author: 蒋梓伦
    * @Description 根据用户输入信息查询数据库是否存在
    * @Date: 13:44 2018/10/3
    * @Param：[用户名, 邮箱, 手机号]
    * @return：对象集合
    **/
    User find(String username);
    User find1(String email);
    User find2(String phone);



    /*
     * @author:李普强
     * @Description描述：用户输入的条件查询出对应的快递员信息，并分页
     * @Date: 10:24 2018/9/29
     * @Param参数：快递员编号 ，名字，手机，邮箱，当前页，页大小
     * @return返回值：快递员对象集合
     **/
    List<User> selectUsers(@Param(value = "id") String id,
                           @Param(value = "username") String username,
                           @Param(value = "phone") String phone,
                           @Param(value = "email") String email,
                           @Param(value = "pageNo") Integer pageNo,
                           @Param(value = "pageSize") Integer pageSize,
                           @Param(value = "type") Integer type,
                           @Param(value = "parentid") Integer parentid);
    /*
     * @author:李普强
     * @Description描述：根据条件查询对应快递员的count记录数
     * @Date: 16:20 2018/9/29
     * @Param参数：快递员编号，名字，手机，邮箱
     * @return返回值：int
     **/
    public int count(@Param(value = "id") String id,
                     @Param(value = "username") String username,
                     @Param(value = "phone") String phone,
                     @Param(value = "email") String email,
                     @Param(value = "type") Integer type,
                     @Param(value = "parentid") Integer parentid);

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
                                 @Param(value = "status") Integer status,
                                 @Param(value = "parentid") Integer parentid);

    /*
     * @author:李普强
     * @Description描述：通过订单id查询一个订单对象，用于页面的单个订单展示
     * @Date: 9:56 2018/10/2
     * @Param参数：订单id
     * @return返回值：订单对象order
     **/
    Order_info selectOrder_Info(@Param(value = "id") String id);



    /*
     * @author:李普强
     * @Description描述：保存修改后的订单对象
     * @Date: 11:09 2018/10/2
     * @Param参数：订单对象order_info
     * @return返回值：int
     **/
    int updateOrder_info(Order_info order_info);

    /**
     * @author: 肖林辉
     * @Description   登录的快递员 查找同一网点下的 其它快递员
     * @Date: 15:23 2018/10/3/003
     * @Param：[parentid, id]
     * @return：java.util.List<com.forest.wu.pojo.User>
     **/

    List<User> selectCouriers(@Param(value = "parentid") int parentid, @Param(value = "id") int id);

    /**
    * author: 张展
    * 查询分公司管理列表
    * Date: 12:47 2018/10/8
    * Param：
    * Return：
    **/
    List<User> findUser(User user);

    /**
    * author: 张展
    * 查询某个分公司管理
    * Date: 13:54 2018/10/8
    * Param：[id]
    * Return：com.forest.wu.pojo.User
    **/
    User selectByUserId(Integer id);



    /*
     * @author:李普强
     * @Description描述：查询出所有快递员
     * @Date: 15:50 2018/10/2
     * @Param参数：无
     * @return返回值：快递员对象集合
     **/
    List<User> allUser(@Param(value = "parentid") Integer parentid);

    /*
     * @author:李普强
     * @Description描述：条件查询工单对象集合信息
     * @Date: 10:04 2018/10/3
     * @Param参数：工单id，寄件人姓名和手机，手机人姓名和手机
     * @return返回值：工单对象的集合
     *
     **/
    List<Workorder> selectWor(@Param(value = "id") Integer id,
                              @Param(value = "gName") String gName,
                              @Param(value = "gTel") String gTel,
                              @Param(value = "sName") String sName,
                              @Param(value = "sTel") String sTel,
                              @Param(value = "site") String site,
                              @Param(value = "workNum") String workNum,
                              @Param(value = "orderNum") String orderNum,
                              @Param(value = "workStatus") Integer workStatus,
                              @Param(value = "gCourier") Integer gCourier,
                              @Param(value = "gPoint") String gPoint);



    /*
     * @author:李普强
     * @Description描述：通过id查询一个工单对象
     * @Date: 15:50 2018/10/3
     * @Param参数：id
     * @return返回值：工单对象
     **/
    Workorder selectWorkor(@Param(value = "id") Integer id);

    /*
     * @author:李普强
     * @Description描述：通过parentid查询出一个组织表中的String地址site
     * @Date: 19:07 2018/10/4
     * @Param参数：parentid
     * @return返回值：String字符串地址
     **/
    String stringSite(@Param(value = "parentid") Integer parentid);

    /*
    * @author:李普强
    * @Description描述：新增一个快递员
    * @Date: 14:01 2018/10/6
    * @Param参数：快递员对象
    * @return返回值：int
    **/
    int addUserKuai(User user);

    /*
    * @author:李普强
    * @Description描述：根据id删除一个快递员对象
    * @Date: 9:47 2018/10/8
    * @Param参数：uid
    * @return返回值：int
    **/
    int deleteUser(@Param(value = "uid") Integer uid);


    /*
    * @author:李普强
    * @Description描述：分配订单后，更新订单表信息，寄件网点id和快递员id
    * @Date: 11:15 2018/10/8
    * @Param参数：快递员id和寄件网点id
    * @return返回值：int
    **/
    int updateOrder(@Param(value = "uid") Integer uid,
                    @Param(value = "orderid") Integer orderid
    );

    /*
    * @author:李普强
    * @Description描述：分配工单后更新工单表
    * @Date: 15:55 2018/10/8
    * @Param参数：快递员id 工单id
    * @return返回值：int
    **/
    int updateWorkor(@Param(value = "id") Integer id,
                     @Param(value = "gid") Integer gid);

    /*
    * @author:李普强
    * @Description描述：查询一个月订单条数
    * @Date: 15:28 2018/10/11
    * @Param参数：无参
    * @return返回值：int
    **/
    List<Integer> selectYueDin();
}