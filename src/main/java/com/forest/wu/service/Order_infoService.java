package com.forest.wu.service;

import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;

import java.util.List;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-09-29 10:10
 **/
public interface Order_infoService {
    /**
    * @author: 肖林辉
    * @Description  查询所有的订单
    * @Date: 10:20 2018/9/29/029
    * @Param：
    * @return：
    **/
    List<Order_info>  selectAllOrder();




    /**
    * @author: 肖林辉
    * @Description  模糊查询订单  根据快递员的编号
    * @Date: 17:03 2018/9/29/029
    * @Param：[]
    * @return：java.util.List<com.forest.wu.pojo.Order_info>
    **/

    List<Order_info>  selectSomeOrder(Order_info order);


    /**
    * @author: 肖林辉 
    * @Description  根据订单号查询出对应的订单
    * @Date: 9:51 2018/10/2/002
    * @Param：[order]
    * @return：com.forest.wu.pojo.Order_info
    **/

    Order_info selectOneOrder(int id);


    /**
    * @author: 肖林辉 
    * @Description   快递员插入工单信息
    * @Date: 16:00 2018/10/2/002
    * @Param：[workorder]
    * @return：int
    **/
    
    int addWorkorderByCourier(Workorder workorder);

    
    /**
    * @author: 肖林辉 
    * @Description   修改订单的订单状态信息
    * @Date: 19:15 2018/10/2/002
    * @Param：[order]
    * @return：int
    **/
    
    int updateOrderStatusByCourier(Order_info order);


    /**
    * @author: 肖林辉 
    * @Description   查找登录的快递  同一网点下的其它快递员
    * @Date: 15:26 2018/10/3/003
    * @Param：[parentid, id]
    * @return：java.util.List<com.forest.wu.pojo.User>
    **/
    
    List<User> selectCouriersByParentId(int parentid,int id);


    /**
     *
     * @author: 任一
     * @Description 添加订单
     * @Date: 8:46 2018/10/5
     * @Param：Order_info
     * @return：boolean
     */
    boolean insertSelective (Order_info order_info);


    /**
    * @author: 肖林辉
    * @Description    快递员查询工单  条件 工单状态为1   寄快递员号要等于登录的快递员编号
    * @Date: 10:33 2018/10/4/004
    * @Param：[workorder]
    * @return：java.util.List<com.forest.wu.pojo.Workorder>
    **/

    List<Workorder> selectWorkOrderByCourier(Workorder workorder);

    /**
    * @author: 肖林辉 
    * @Description   更新订单的委托状态
    * @Date: 14:21 2018/10/5/005
    * @Param：[order]
    * @return：int
    **/
    
    int updateOrderWeituoStatus(Order_info order);

    /**
     *
     * @author: 任一
     * @Description 客户查询订单数量
     * @Date: 9:51 2018/10/6
     * @Param：
     * @return：int
     */
    int getMyOrderCount(Integer userId, String orderNumber, String gName, String gTel, Integer status);

    /**
     * @author: 任一
     * @Description 客户查询订单列表（分页，按id逆序）
     * @Date: 10:56 2018/10/6
     * @Param：
     * @return：
     */
    List<Order_info> getMyOrderList(Integer userId, String orderNumber, String gName, String gTel, Integer status,
                                    Integer pageNo, Integer pageSize);

    /**
     *
     * @author: 任一
     * @Description 查看明细
     * @Date: 13:53 2018/10/8
     * @Param：
     * @return：
     */
    Order_info getMyOrderInfo(Integer id);

    /**
     *
     * @author: 任一
     * @Description 取消预约
     * @Date: 9:37 2018/10/9
     * @Param：
     * @return：
     */
    boolean offOrderById(Integer id);


    /**
    * @author: 肖林辉
    * @Description  查询单个工单
    * @Date: 10:34 2018/10/9/009
    * @Param：[id]
    * @return：int
    **/

    Workorder selectByPrimaryKeyByCourier(Integer id);

    
    /**
    * @author: 肖林辉 
    * @Description   最近一周的订单数量
    * @Date: 15:39 2018/10/9/009
    * @Param：[]
    * @return：int
    **/
    
    int selectOrderCount();

}
