package com.forest.wu.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.forest.wu.pojo.*;
import com.forest.wu.service.DictionaryService;
import com.forest.wu.service.NoteService;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.service.OrganizationService;
import com.forest.wu.utils.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-09-29 9:28
 **/
@Controller
@RequestMapping(value = "/calculate")
public class ClientController {
    @Resource
    private OrganizationService organizationService;
    @Resource
    private DictionaryService dictionaryService;
    @Resource
    private Order_infoService order_infoService;
    @Resource
    private NoteService noteService;

    //运算计费时效


    /**
     * @author: 任一
     * @Description
     * @Date: 9:14 2018/10/2
     * @Param：Model
     * @return：moneyestimate_ry 进入页面的数据获取
     */
    @RequestMapping("/moneyestimate")
    public String moneyestimate(Model model, HttpSession session) {
        List<Organization> cityList = organizationService.filialeList();
        model.addAttribute("cityList", cityList);

        //站内信息
        Integer id = ((User) session.getAttribute("user")).getId();
        getNote(id, model);
        return "ry/moneyestimate_ry";
    }

    /**
     * @author: 任一
     * @Description
     * @Date: 16:24 2018/9/29
     * @Param： String cityA , String cityB , int estimatedWeight
     * @return：Map<String,Object>
     */
    @RequestMapping("/result.json")
    @ResponseBody
    public Object calculate(@RequestParam String cityA, @RequestParam String cityB, @RequestParam int estimatedWeight) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        int distance = DistanceUtils.getDistance(cityA, cityB);
        String time = CalculateMoneyEstimate.calculateTime(distance);
        //重量小于3公斤，按3公斤算
        if (estimatedWeight < 3) {
            estimatedWeight = 3;
        }
        double money = CalculateMoneyEstimate.calculateMoney(distance, estimatedWeight);

        map.put("weight", estimatedWeight);
        map.put("timeT", time);
        map.put("money", money);
        return map;
    }


    //服务网点查询


    /**
     * @author: 任一
     * @Description
     * @Date: 10:19 2018/10/2
     * @Param：Model
     * @return：branchquery_ry 进入页面的数据获取
     */

    @RequestMapping(value = "/branchquery", method = RequestMethod.GET)
    public String branchquery(Model model, HttpSession session,
                              @RequestParam(value = "city", required = false) String _cityId,
                              @RequestParam(value = "pageIndex", required = false) String pageIndex) {
        List<Organization> cityList = null;
        List<Organization> branchList = null;

        //页面容量
        int pageSize = Constants.PAGE_SIZE;
        //当前页码
        Integer pageNo = 1;
        if (pageIndex != null) {
            try {
                pageNo = Integer.valueOf(pageIndex);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        //站内信息
        Integer id = ((User)session.getAttribute("user")).getId();
        getNote(id,model);

        //查询城市不为空
        Integer cityId = null;
        if (null != _cityId && !_cityId.equals("")) {
            cityId = Integer.parseInt(_cityId);
        } else {
            cityList = organizationService.filialeList();
            model.addAttribute("cityList", cityList);
            return "ry/branchquery_ry";
        }

        //总数量（列表）
        int totalCount = 0;
        try {
            totalCount = organizationService.getCount(3, cityId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //总页数
        Page pages = new Page();
        pages.setPageNo(pageNo);//当前页
        pages.setPageSize(pageSize);//页大小
        pages.setCount(totalCount);//数据数量
        int totalPageCount = pages.getPageCount();

        //控制首页和尾页
        if (pageNo < 1) {
            pageNo = 1;
        } else if (pageNo > totalPageCount) {
            pageNo = totalPageCount;
        }

        try {
            //城市列表（下拉框显示）
            cityList = organizationService.filialeList();
            //网点列表
            branchList = organizationService.getBranchList(cityId, pageNo, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }


        //限制分公司
        if (branchList.size() == 0) {
            model.addAttribute("nullErro", "该城市网点正在紧张建设中");
            model.addAttribute("cityList", cityList);
            return "ry/branchquery_ry";
        }
        if (cityId != 2 && cityId != 3 && cityId != 9 && cityId != 10) {
            model.addAttribute("nullErro", "该城市分公司正在紧张建设中");
            model.addAttribute("cityList", cityList);
            return "ry/branchquery_ry";
        }

        model.addAttribute("cityList", cityList);
        model.addAttribute("branchList", branchList);
        model.addAttribute("cityId", cityId);
        model.addAttribute("pages", pages);

        return "ry/branchquery_ry";
    }


    //查件


    /**
     * @author: 任一
     * @Description 我要查件页面的进入和查询
     * @Date: 16:42 2018/10/6
     * @Param：
     * @return：
     */
    @RequestMapping(value = "/query")
    public String queryInfoList(Model model, HttpSession session,
                                @RequestParam(value = "queryOrderNumber", required = false) String orderNumber,
                                @RequestParam(value = "queryGName", required = false) String gName,
                                @RequestParam(value = "queryGTel", required = false) String gTel,
                                @RequestParam(value = "queryOrderStatus", required = false) String _statusId,
                                @RequestParam(value = "pageIndex", required = false) String pageIndex) {
        //清空空格数据（解决未填表单提交后变空格问题）
        if (orderNumber == null || orderNumber.equals("")) {
            orderNumber = null;
        }
        if (gName == null || gName.equals("")) {
            gName = null;
        }
        if (gTel == null || gTel.equals("")) {
            gTel = null;
        }


        //用户Id
        Integer userId = ((User) session.getAttribute("user")).getId();

        List<Dictionary> orderStatusList = null;    //订单状态下拉框
        List<Order_info> orderList = null;          //查询的订单列表


        //页面容量
        int pageSize = Constants.PAGE_SIZE;
        //当前页码
        Integer pageNo = 1;
        if (pageIndex != null) {
            try {
                pageNo = Integer.valueOf(pageIndex);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        Integer statusId = null;
        if (_statusId != null && !_statusId.equals("")) {
            statusId = Integer.parseInt(_statusId);
        }

        //总数量
        int totalCount = 0;
        try {
            totalCount = order_infoService.getMyOrderCount(userId, orderNumber, gName, gTel, statusId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //总页数
        Page pages = new Page();
        pages.setPageNo(pageNo);//当前页
        pages.setPageSize(pageSize);//页大小
        pages.setCount(totalCount);//数据数量
        int totalPageCount = pages.getPageCount();

        //控制首页和尾页
        if (pageNo < 1) {
            pageNo = 1;
        } else if (pageNo > totalPageCount) {
            pageNo = totalPageCount;
        }

        try {
            orderStatusList = dictionaryService.queryDictionaryList("orderStatus");
            orderList = order_infoService.getMyOrderList(userId, orderNumber, gName, gTel, statusId, pageNo, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //未查询到订单列表传入错误信息
        if (orderList.size() == 0) {
            model.addAttribute("nullListErro", "抱歉，未查询到订单");
        } else {//查询到则传入订单列表
            model.addAttribute("orderList", orderList);
        }
        model.addAttribute("orderStatusList", orderStatusList);
        model.addAttribute("pages", pages);
        model.addAttribute("orderNumber", orderNumber);
        model.addAttribute("gName", gName);
        model.addAttribute("gTel", gTel);
        model.addAttribute("orderStatus", statusId);

        //站内信息显示
        getNote(userId, model);
        return "ry/query_ry";
    }

    /**
     * @author: 任一
     * @Description 查看明细ajax查询方法
     * @Date: 16:44 2018/10/6
     * @Param：
     * @return：
     */
    @RequestMapping(value = "getOrderInfo.json", method = RequestMethod.GET)
    @ResponseBody
    public Object getOrderInfo(@RequestParam Integer id) {
        HashMap<String, Object> orderInfo = new HashMap<String, Object>();
        Order_info order = order_infoService.getMyOrderInfo(id);
        orderInfo.put("orderInfo", order);
        return orderInfo;
    }

    /**
     * @author: 任一
     * @Description 取消预约ajax
     * @Date: 9:50 2018/10/9
     * @Param：
     * @return：
     */
    @RequestMapping(value = "offOrder.json", method = RequestMethod.GET)
    @ResponseBody
    public Object offOrder(@RequestParam Integer id, Model model) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        if (order_infoService.offOrderById(id)) {
            resultMap.put("result", "success");
        } else {
            resultMap.put("result", "false");
        }
        return resultMap;
    }


    //寄件服务


    /**
     * @author: 任一
     * @Description
     * @Date: 16:26 2018/10/4
     * @Param：Model,String(_cityId),String(_branchId)
     * @return：ry/send_ry 进入寄件页面
     */
    @RequestMapping(value = "/intosend", method = RequestMethod.GET)
    public String intosend(Model model, HttpSession session,
                           @RequestParam(value = "cityId", required = false) String _cityId,
                           @RequestParam(value = "branchId", required = false) String _branchId) {
        List<Organization> cityList = organizationService.filialeList();
        List<Dictionary> typeList = dictionaryService.selectGoodsStatus();
        model.addAttribute("typeList", typeList);
        model.addAttribute("cityList", cityList);

        //站内信息
        Integer userId = ((User) session.getAttribute("user")).getId();
        getNote(userId, model);

        if (null != _cityId && !"".equals(_cityId) && null != _branchId && !"".equals(_branchId)) {
            Integer cityId = Integer.parseInt(_cityId);
            Integer branchId = Integer.valueOf(_branchId);
            List<Organization> branchList = organizationService.selectByParentId(cityId);
            model.addAttribute("branchList", branchList);
            model.addAttribute("cityId", cityId);
            model.addAttribute("branchId", branchId);
        }

        return "ry/send_ry";
    }

    /**
     * @author: 任一
     * @Description 保存订单信息
     * @Date: 10:02 2018/10/5
     * @Param：Order_info(order_info),Model(model)
     * @return：
     */
    @RequestMapping(value = "/savesend", method = RequestMethod.POST)
    public String savesend(Order_info order_info, Model model) {
        //订单号
        int num = (int) (Math.random() * 9000) + 1000;
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String orderNumber = order_info.getUserId() + format.format(date) + num;
        order_info.setOrderNumber(orderNumber);

        //订单状态
        order_info.setStatus(1);

        //创建时间
        order_info.setRiseTime(new Date());

        //执行添加
        try {
            if (order_infoService.insertSelective(order_info)) {
                return "redirect:/calculate/query";
            } else {
                model.addAttribute("sendErro", "对不起，订单生成失败，请重试或联系管理员");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/calculate/intosend";
    }

    /**
     * @author: 任一
     * @Description
     * @Date: 16:28 2018/10/4
     * @Param：
     * @return：List<Organization> ajax返回网点列表
     */
    @RequestMapping(value = "queryBranchList.json", method = RequestMethod.GET)
    @ResponseBody
    public List<Organization> queryBranchList(@RequestParam Integer parentId) {
        List<Organization> branchList = organizationService.selectByParentId(parentId);
        //限制分公司选择
        if (parentId != 2 && parentId != 3 && parentId != 9 && parentId != 10) {
            branchList = null;
        }
        return branchList;
    }


    //支付宝支付

    /**
     * @author: 任一
     * @Description 支付宝支付
     * @Date: 15:06 2018/10/9
     * @Param：
     * @return：
     */
    @RequestMapping(value = "/goPay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String zhiFuBaoPay(HttpServletRequest request,
                              HttpServletRequest response,
                              @RequestParam String orderNumber,
                              @RequestParam String price,
                              @RequestParam String product,
                              @RequestParam String comment) throws Exception {


        String description = orderNumber;   //订单描述

        //向支付宝发起请求
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                "json", AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
//        alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
//        alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderNumber;
        //付款金额，必填
        String total_amount = price;
        //订单名称，必填
        String subject = product;
        //商品描述，可空
        String body = comment;


         //相当于拼接成一个form表单
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求
        String result = "";
        try {
            result = alipayClient.pageExecute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        //输出跳转到----支付宝网关
        return result;
    }

    /**
     *
     * @author: 任一
     * @Description 支付成功同步通知页面
     * @Date: 16:43 2018/10/12
     * @Param：
     * @return：
     */
    @RequestMapping(value = "/success")
    public String success(HttpServletRequest request,Model model) {
//        Map<String, String> params = new HashMap<String, String>();
//        Map<String, String[]> requestParams = request.getParameterMap();
//        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
//            String name = (String) iter.next();
//            String[] values = (String[]) requestParams.get(name);
//            String valueStr = "";
//            for (int i = 0; i < values.length; i++) {
//                valueStr = (i == values.length - 1) ? valueStr + values[i]
//                        : valueStr + values[i] + ",";
//            }
//        }
//        //调用SDK验证签名
//        boolean signVerified = AlipaySignature.rsaCheckV1(params,AlipayConfig.alipay_public_key,AlipayConfig.charset,AlipayConfig.sign_type);
//
//        if(signVerified) {
//            //商户订单号
//            String orderNumber = new String(request.getParameter("out_trade_no"));
//            //支付宝交易号
//
//            //付款金额
//        }

        //订单号
        String orderNumber = new String(request.getParameter("out_trade_no"));
        //修改支付状态
        if(order_infoService.payDone(orderNumber)){
            model.addAttribute("result","支付成功！");
        }else{
            model.addAttribute("result","支付失败，很抱歉，请稍后重试或联系客服！");
        }
        model.addAttribute("orderNumber",orderNumber);

        return "ry/success";
    }

    /**
     *
     * @author: 任一
     * @Description 支付异步通知页面
     * @Date: 16:43 2018/10/12
     * @Param：
     * @return：
     */
    @RequestMapping(value = "/notify")
    public String notifys() {
        return "ry/notify";
    }


    //站内信息

    /**
     * @author: 任一
     * @Description 获取站内信息
     * @Date: 17:01 2018/10/11
     * @Param：
     * @return：
     */
    public void getNote(Integer id, Model model) {
        //信息集合
        List<Note> noteList = noteService.getNoteSelf(id);
        model.addAttribute("noteList", noteList);

        //未读邮件数
        Integer noRead = noteService.noReadCount(id);
        model.addAttribute("noRead", noRead);
    }

    /**
     * @author: 任一
     * @Description ajax更新数据已读状态
     * @Date: 9:30 2018/10/12
     * @Param：
     * @return：
     */
    @RequestMapping(value = "readNote.json")
    @ResponseBody
    public Object readNote(HttpSession session) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        Integer id = ((User) session.getAttribute("user")).getId();
        //邮件改为已读
        if (!noteService.readDone(id)) {
            result.put("doneErro", "数据异常，错误代码：ddd，请联系管理员");
        }
        return result;
    }

    @RequestMapping(value = "/readAll")
    public String readAll(HttpSession session,Model model,
                          @RequestParam(value = "pageIndex", required = false) String pageIndex) {
        readNote(session);
        Integer id = ((User) session.getAttribute("user")).getId();
        List<Note> allNote = null;
        //页面容量
        int pageSize = Constants.PAGE_SIZE;
        //当前页码
        Integer pageNo = 1;
        if (pageIndex != null) {
            try {
                pageNo = Integer.valueOf(pageIndex);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        //总数量
        int totalCount = 0;
        try {
            totalCount = noteService.noteCountSelf(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //总页数
        Page pages = new Page();
        pages.setPageNo(pageNo);//当前页
        pages.setPageSize(pageSize);//页大小
        pages.setCount(totalCount);//数据数量
        int totalPageCount = pages.getPageCount();

        //控制首页和尾页
        if (pageNo < 1) {
            pageNo = 1;
        } else if (pageNo > totalPageCount) {
            pageNo = totalPageCount;
        }

        try {
            allNote = noteService.getAllSelf(id, pageNo, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("pages", pages);
        model.addAttribute("noteList",allNote);
        model.addAttribute("readAll","yes");
        return "ry/note_ry";
    }

    @RequestMapping(value = "deleteNote.json")
    @ResponseBody
    public Object deleteNote(@RequestParam String id){
        HashMap<String,String> result = new HashMap<String, String>();
        if(StringUtils.isEmpty(id)){
            result.put("delResult","notexist");
        }else {
            try {
                if (noteService.deleteNoteById(id)) {
                    result.put("delResult", "true");
                }else {
                    result.put("delResult", "false");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    /**
     *
     * @author: 添加接口测试类
     * @Description 
     * @Date: 8:58 2018/10/16
     * @Param：
     * @return：
     */
    public void addNote(){
          noteService.addNote(15,"测试1");
    }



    //报表

    /**
     * @author: 任一
     * @Description 进入报表页面
     * @Date: 14:07 2018/10/11
     * @Param：
     * @return：
     */
    @RequestMapping(value = "/intobaobiao")
    public String intoBaoBiao(Model model, HttpSession session) {
        Integer id = ((User) session.getAttribute("user")).getId();
        getNote(id, model);
        return "ry/baobiao_ry";
    }

    /**
     * @author: 任一
     * @Description ajax返回报表数据
     * @Date: 16:33 2018/10/11
     * @Param：
     * @return：
     */
    @RequestMapping(value = "getbaobiao.json")
    @ResponseBody
    public Object getBaoBiao(HttpSession session) {
        List<Integer> result = new ArrayList<Integer>();
        String[] month = {"2018-01-01", "2018-02-01", "2018-03-01", "2018-04-01", "2018-05-01",
                "2018-06-01", "2018-07-01", "2018-08-01", "2018-09-01", "2018-10-01",
                "2018-11-01", "2018-12-01"};
        String start = null;
        String end = null;
        Integer id = ((User) session.getAttribute("user")).getId();
        for (int i = 0; i < month.length; i++) {
            start = month[i];
            if (i + 1 == month.length) {
                end = month[0];
            } else {
                end = month[i + 1];
            }
            if (!result.add(order_infoService.getMonthOrder(id, start, end))) {
                return false;
            }
        }
        return result;
    }
}
