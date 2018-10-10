package com.forest.wu.controller;

import com.forest.wu.dao.*;
import com.forest.wu.pojo.*;
import com.forest.wu.service.DictionaryService;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.service.OrganizationService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.corba.se.spi.orbutil.threadpool.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

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

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private DictionaryService   dictionaryService;

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
     * @Description   按条件查询,模糊查询
     * @Date: 16:28 2018/9/30/030
     * @Param：[pageIndex, queryOrderNum, querysName, querysTel, order, model]
     * @return：java.lang.String
     **/

    @RequestMapping("/baobiao_someorder")
    public String baobiao_someOrder(@RequestParam(required = true,defaultValue = "1")Integer pageIndex,
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
        return "xlh/baobiao_dindan_xlh";
    }
    /**
    * @author: 肖林辉 
    * @Description  订单页面跳转到订单详情页面
    * @Date: 16:29 2018/9/30/030
    * @Param：
    * @return：
    **/

    @RequestMapping(value = "/toaddgongdan")
    public String toOrderXianqing(@RequestParam(value="id",required = false)int id,
                                  @RequestParam(value = "cityId", required = false) String _cityId,
                                  @RequestParam(value = "branchId", required = false) String _branchId,
                                  Model model){
        //发送订单的信息
        Order_info orderInfo=orderService.selectOneOrder(id);
        model.addAttribute("order",orderInfo);

        //发送工单号
        String workNum=UUID.randomUUID().toString();
        model.addAttribute("workNumber",workNum);

        //发送目标城市集合
        List<Organization> cityList = organizationService.filialeList();
        model.addAttribute("cityList", cityList);
        if (null != _cityId && !"".equals(_cityId) && null != _branchId && !"".equals(_branchId)) {
            Integer cityId = Integer.parseInt(_cityId);
            Integer branchId = Integer.valueOf(_branchId);
            List<Organization> branchList = organizationService.selectByParentId(cityId);
            model.addAttribute("branchList", branchList);
            model.addAttribute("cityId", cityId);
            model.addAttribute("branchId", branchId);
        }

        //发送物品类型到页面
        List<Dictionary> goodtypeList=dictionaryService.selectGoodsStatus();
        model.addAttribute("goodtypeList",goodtypeList);


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
    @RequestMapping(value = "/saveworkorder")
    public String addWorkorder(Workorder workorder, BindingResult bindingResult, HttpSession session,
                               @RequestParam("orderid")String id){
        //根据Id找到相应订单的信息
       //插入工单信息
        User user=(User)session.getAttribute("user");
        workorder.setProductLocation(2);
        Date date=new Date();
        workorder.setRiseTime(date);
        workorder.setProductNum(Long.valueOf(id));
        workorder.setgCourier(user.getId());
        workorder.setWorkStatus(1);  // 工单状态为待审核
       orderService.addWorkorderByCourier(workorder);
       //修改订单中的状态   1为预订  2 已接单  将1 修改为2
        Order_info order = new Order_info();
        order.setOrderNumber(workorder.getOrderNum());
        orderService.updateOrderStatusByCourier(order);

       int  uid=user.getId();
       return "redirect:/order/someorder?courierNum="+uid;
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
                              Model model,HttpSession session){
        User user=(User)session.getAttribute("user");
        Order_info orderInfo=orderService.selectOneOrder(Integer.parseInt(id));
        model.addAttribute("order",orderInfo);

        List<User>  couriersList = userMapper.selectCouriers(user.getParentid(),user.getType());
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
            Workorder workorder=orderService.selectByPrimaryKeyByCourier(id);
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
    * @Description   进入工单委托页面
    * @Date: 9:38 2018/10/6/006
    * @Param：[orderid, session, model]
    * @return：java.lang.String
    **/

    @RequestMapping(value="toworkweituo")
    public String toworkWeiTuo(@RequestParam(value="id")Integer workid,HttpSession session,Model model){
        User user=(User)session.getAttribute("user");
        List<User> couriersList=userMapper.selectCouriers(user.getParentid(),user.getId());
        model.addAttribute("couriersList",couriersList);
        model.addAttribute("workId",workid);
        return "xlh/workweituo_xlh";
    }

    /**
    * @author: 肖林辉 
    * @Description   订单委托状态修改
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

    /**
    * @author: 肖林辉
    * @Description   工单委托状态修改
    * @Date: 10:02 2018/10/6/006
    * @Param：[session, courierId, orderId]
    * @return：java.lang.String
    **/

    @RequestMapping("updateworkweituo")
    public String updateWorkWeituoStatus(HttpSession session,
                                          @RequestParam(value="courierId")Integer courierId,
                                          @RequestParam(value="workId")Integer workId) {
        User user = (User) session.getAttribute("user");


        Workorder workorder=new Workorder();
        workorder.setId(workId);
        workorder.setEntrust(1);
        workorder.setEntrustNumber(user.getId());

        workorder.setsCourier(courierId);
        workorderMapper.updateByPrimaryKeySelective(workorder);


        int id=user.getId();
        return "redirect:/order/toworkorder?courierNum="+id;
    }
    /**
    * @author: 肖林辉 
    * @Description   借鉴任一的两表联动,显示对应的城市与网点
    * @Date: 13:53 2018/10/8/008
    * @Param：[parentId]
    * @return：java.util.List<com.forest.wu.pojo.Organization>
    **/
    
    @RequestMapping(value = "queryBranchList.json", method = RequestMethod.GET)
    @ResponseBody
    public List<Organization> queryBranchList(@RequestParam Integer parentId) {
        List<Organization> branchList = organizationService.selectByParentId(parentId);
        return branchList;
    }

    @RequestMapping(value="finishedWorkorder")
    public String  updateWorkorder(HttpSession session,
                                   @RequestParam(value = "id" )String workId){
        User user = (User) session.getAttribute("user");

        Workorder workorder=new Workorder();
        workorder.setId(Integer.parseInt(workId));
        workorder.setWorkStatus(5);
        Date date=new Date();
        workorder.setFinishedTime(date);
        workorderMapper.updateByPrimaryKeySelective(workorder);
        int id=user.getId();
        return  "redirect:toworkorder/?courierNum="+id;
    }


    @RequestMapping(value = "aweekorder")
    @ResponseBody
    public int selectOrderCount(){
        return orderService.selectOrderCount();
    }

}
