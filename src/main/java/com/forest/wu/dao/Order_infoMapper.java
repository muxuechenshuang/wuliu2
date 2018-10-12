package com.forest.wu.dao;

import com.forest.wu.pojo.Order_info;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface Order_infoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order_info record);

    int insertSelective(Order_info record);

    Order_info selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order_info record);

    int updateByPrimaryKey(Order_info record);


    /**
     * @author: 肖林辉
     * @Description
     * @Date: 9:20 2018/9/29/029
     * @Param：[order_info]
     * @return：java.util.List<com.forest.wu.pojo.Order_info>
     **/
    List<Order_info> selectAllOrder();


    /**
     * @author: 肖林辉
     * @Description 根据查询条件查询出对应的订单, 没有条件则查全部
     * @Date: 17:00 2018/9/29/029
     * @Param：[]
     * @return：java.util.List<com.forest.wu.pojo.Order_info>
     **/
    List<Order_info> selectSomeOrder(Order_info order);


    /**
     * @author: 肖林辉
     * @Description 根据orderid查询出对应的订单号
     * @Date: 9:50 2018/10/2/002
     * @Param：[order]
     * @return：com.forest.wu.pojo.Order_info
     **/

    Order_info selectOneOrderByCourier(int id);


    /**
     * @author: 肖林辉
     * @Description 修改订单状态
     * @Date: 20:54 2018/10/2/002
     * @Param：[order]
     * @return：int
     **/

    int updateOrderStatusByCourier(Order_info order);

    /**
     * @author: 肖林辉
     * @Description 更新订单的委托状态   entrust   entrustNumber  courierNumber
     * @Date: 14:19 2018/10/5/005
     * @Param：[order]
     * @return：int
     **/

    int updateOrderToWeituoStatus(Order_info order);

    /**
     * @author: 任一
     * @Description 客户查询订单数量
     * @Date: 9:51 2018/10/6
     * @Param：
     * @return：int
     */
    int getMyOrderCount(@Param(value = "userId")Integer userId,@Param(value = "orderNumber") String orderNumber, @Param(value = "gName")String gName,@Param(value = "gTel") String gTel, @Param(value = "status")Integer status);

    /**
     * @author: 任一
     * @Description 客户查询订单列表（分页，按id逆序）
     * @Date: 10:56 2018/10/6
     * @Param：
     * @return：
     */
    List<Order_info> getMyOrderList(@Param(value = "userId") Integer userId,@Param(value = "orderNumber") String orderNumber, @Param(value = "gName")String gName, @Param(value = "gTel")String gTel, @Param(value = "status")Integer status,
                                    @Param(value = "from") Integer pageNo, @Param(value = "pageSize") Integer pageSize);

    /**
     *
     * @author: 任一
     * @Description 查看明细
     * @Date: 13:53 2018/10/8
     * @Param：
     * @return：
     */
    Order_info getMyOrderInfo(@Param(value = "id")Integer id);

    /**
     *
     * @author: 任一
     * @Description 取消预约
     * @Date: 9:37 2018/10/9
     * @Param：
     * @return：
     */
    int offOrderById(@Param(value = "id")Integer id);


    /**
     * @author: 肖林辉
     * @Description 查询最近一周的订单数量
     * @Date: 15:38 2018/10/9/009
     * @Param：[]
     * @return：java.lang.Integer
     **/

    public  Integer  selectOrderCount();

    /**
     *
     * @author: 任一
     * @Description 查询某时间段里订单数
     * @Date: 14:31 2018/10/11
     * @Param：
     * @return：
     */
    Integer getMonthOrder(@Param(value = "start")Date start,@Param(value = "end") Date end);


    public  Integer  selectOrderCount(@Param("day")Integer pastDay);
}