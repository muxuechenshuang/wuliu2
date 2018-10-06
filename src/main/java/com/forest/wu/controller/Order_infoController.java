package com.forest.wu.controller;

import com.forest.wu.dao.Order_infoMapper;
import com.forest.wu.dao.UserMapper;
import com.forest.wu.dao.WorkorderMapper;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.User;
import com.forest.wu.pojo.Workorder;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.corba.se.spi.orbutil.threadpool.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-09-29 10:31
 **/
@Controller
@RequestMapping("/order")
public class Order_infoController {
    @Autowired
    private Order_infoService  orderService;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private WorkorderMapper workorderMapper;

    /**
    * @author: 肖林辉
    * @Description  查询所有
    * @Date: 10:36 2018/9/29/029
    * @Param：[]
    * @return：List<Order_info>
    **/
   /* @RequestMapping("/allorder")
    public String allOrder(@RequestParam(required = true,defaultValue = "1")Integer pageIndex,Model model){
        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        List<Order_info> orderList=orderService.selectAllOrder();
        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
        model.addAttribute("pageIndex",p);
        model.addAttribute("order",orderList);
        return "xlh/dindan_xlh";
    }*/
    
    
    /**
    * @author: 肖林辉 
    * @Description   按条件查询,模糊查询
    * @Date: 16:28 2018/9/30/030
    * @Param：[pageIndex, queryOrderNum, querysName, querysTel, order, model]
    * @return：java.lang.String
    **/
    
    @RequestMapping("/someorder")
    public String someOrder(@RequestParam(required = true,defaultValue = "1")Integer pageIndex,
                            @RequestParam(value = "orderNumber",required = false)String queryOrderNum,
                            @RequestParam(value = "sName",required = false)String querysName,
                            @RequestParam(value = "sTel",required = false)String querysTel,
                            @RequestParam(value = "courierNum",required = false)Integer courierNum,
                            Order_info order, Model model){

        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        order.setCourierNumber(courierNum);
        List<Order_info> orderList=orderService.selectSomeOrder(order);
        PageInfo<Order_info> p=new PageInfo<Order_info>(orderList);
        model.addAttribute("pageIndex",p);
        model.addAttribute("order",orderList);

        //回显
        model.addAttribute("queryNumber",queryOrderNum);
        model.addAttribute("querysName",querysName);
        model.addAttribute("querysTel",querysTel);
        return "xlh/dindan_xlh";
    }

    /**
    * @author: 肖林辉 
    * @Description  订单页面跳转到订单详情页面
    * @Date: 16:29 2018/9/30/030
    * @Param：
    * @return：
    **/

    @RequestMapping(value = "/toaddgongdan",method = RequestMethod.GET)
    public String toOrderXianqing(@RequestParam(value="id",required = false)int id,Model model){
        //发送订单的信息
        Order_info orderInfo=orderService.selectOneOrder(id);
        model.addAttribute("order",orderInfo);

        //发送工单号
        String workNum=UUID.randomUUID().toString();
        model.addAttribute("workNumber",workNum);

        //发送网点名称

        //快递员编号

        return "xlh/addinfo_xlh";
    }
    
    
    /**
    * @author: 肖林辉 
    * @Description   快递员生成初步的工单
    * @Date: 14:36 2018/10/2/002
    * @Param：
    * @return：
    **/
    @RequestMapping(value = "/saveworkorder",method = RequestMethod.GET)
    public String addWorkorder(Workorder workorder,HttpSession session){
        //根据Id找到相应订单的信息
       //插入工单信息
        workorder.setProductLocation("2");
       orderService.addWorkorderByCourier(workorder);
       //修改订单中的状态   1为预订  2 已接单  将1 修改为2
        Order_info order = new Order_info();
        order.setOrderNumber(workorder.getOrderNum());
        orderService.updateOrderStatusByCourier(order);
        User user=(User)session.getAttribute("user");
       int  id=user.getId();
       return "redirect:/order/someorder?courierNum="+id;
    }
    
    /**
    * @author: 肖林辉 
    * @Description  跳转到订单详情页面
    * @Date: 15:31 2018/10/3/003
    * @Param：[id, model]
    * @return：java.lang.String
    **/
    
    @RequestMapping(value="/toorderdesc")
    public String toOrderDesc(@RequestParam(value="id",required = false)String id,
                              @RequestParam(value="parentid",required = false)String parentid,
                              @RequestParam(value = "usertype",required = false)String usertype, Model model){
        Order_info orderInfo=orderService.selectOneOrder(Integer.parseInt(id));
        model.addAttribute("order",orderInfo);

        List<User>  couriersList = userMapper.selectCouriers(Integer.parseInt(parentid),Integer.parseInt(usertype));
        model.addAttribute("couriers",couriersList);
        return  "xlh/orderxianqian_xlh";
    }

    /**
    * @author: 肖林辉
    * @Description   跳转到工单页面
    * @Date: 9:34 2018/10/4/004
    * @Param：[]
    * @return：java.lang.String
    **/
    @RequestMapping("/toworkorder")
    public String  toWorkorder(@RequestParam(value="pageIndex",required = true,defaultValue = "1")Integer pageIndex,
                               @RequestParam(value = "courierNum",required = false)Integer sCourier,

                               @RequestParam(value = "workNum",required = false)String queryworkNum,
                               @RequestParam(value = "orderNum",required = false)String queryorderNum,
                               @RequestParam(value = "gName",required = false)String querygName,
                               @RequestParam(value = "gTel",required = false)String querygTel,
                               @RequestParam(value = "gAddress",required = false)String querygAddress,
                               Workorder workorder, Model model){

        workorder.setsCourier(sCourier);


        PageHelper.startPage(pageIndex, Constants.PAGE_SIZE);
        List<Workorder> workorderList =workorderMapper.selectWorkOrderByCourier(workorder);
        PageInfo<Workorder> p=new PageInfo<Workorder>(workorderList );
        model.addAttribute("pageIndex",p);
        model.addAttribute("workorderList",workorderList );

        model.addAttribute("queryworkNum",queryworkNum);
        model.addAttribute("queryorderNum",queryorderNum);
        model.addAttribute("querygName",querygName);
        model.addAttribute("querygTel",querygTel);
        model.addAttribute("querygAddress",querygAddress);
        return "xlh/gondan_xlh";
    }


    /**
    * @author: 肖林辉 
    * @Description  进入到工单详情页面
    * @Date: 10:13 2018/10/5/005
    * @Param：[]
    * @return：java.lang.String
    **/

    @RequestMapping("/toworkorderdesc")
    public String toWorkorderDesc(HttpSession session,Model model,
                                  @RequestParam(value = "id")Integer id){
        /*User user=(User)session.getAttribute("user");*/
        try {
            Workorder workorder=workorderMapper.selectWorkOrderById(id);
            model.addAttribute(workorder);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "xlh/gondanxiangqing_xlh";
    }
    /**
    * @author: 肖林辉 
    * @Description   进入委托页面
    * @Date: 14:30 2018/10/5/005
    * @Param：[orderid, session, model]
    * @return：java.lang.String
    **/
    
    @RequestMapping(value="toweituo")
    public String toWeiTuo(@RequestParam(value="id")Integer orderid,HttpSession session,Model model){
        User user=(User)session.getAttribute("user");
        List<User> couriersList=userMapper.selectCouriers(user.getParentid(),user.getId());
        model.addAttribute("couriersList",couriersList);
        model.addAttribute("orderId",orderid);
        return "xlh/weituo_xlh";
    }

    /**
    * @author: 肖林辉 
    * @Description   委托状态修改
    * @Date: 14:31 2018/10/5/005
    * @Param：[]
    * @return：java.lang.String
    **/
    @RequestMapping("updateweituo")
    public String updateOrderWeituoStatus(HttpSession session,
                                          @RequestParam(value="courierId")Integer courierId,
                                          @RequestParam(value="orderId")Integer orderId) {
        User user = (User) session.getAttribute("user");
        Order_info order = new Order_info();
        order.setId(orderId);
        order.setEntrust(1);
        order.setEntrustNumber(user.getId());
        order.setCourierNumber(courierId);
        orderService.updateOrderWeituoStatus(order);
        int id=user.getId();
        return "redirect:/order/someorder?courierNum="+id;
    }
}
