package com.forest.wu.controller;

import com.forest.wu.pojo.Dictionary;
import com.forest.wu.pojo.Order_info;
import com.forest.wu.pojo.Organization;
import com.forest.wu.service.DictionaryService;
import com.forest.wu.service.Order_infoService;
import com.forest.wu.service.OrganizationService;
import com.forest.wu.utils.CalculateMoneyEstimate;
import com.forest.wu.utils.Constants;
import com.forest.wu.utils.DistanceUtils;
import com.forest.wu.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

    //运算计费时效


    /**
     * @author: 任一
     * @Description
     * @Date: 9:14 2018/10/2
     * @Param：Model
     * @return：moneyestimate_ry 进入页面的数据获取
     */
    @RequestMapping("/moneyestimate")
    public String moneyestimate(Model model) {
        List<Organization> cityList = organizationService.filialeList();
        model.addAttribute("cityList", cityList);
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
    public String branchquery(Model model,
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

        if(branchList.size()==0){
            model.addAttribute("nullErro","该城市网点正在紧张建设中");
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


    @RequestMapping(value = "/query")
    public String queryInfoList(Model model, HttpSession session,
                                @RequestParam(value = "queryOrderNumber",required = false)String orderNumber,
                                @RequestParam(value = "queryGName",required = false)String gName,
                                @RequestParam(value = "queryGTel",required = false)String gTel,
                                @RequestParam(value = "queryOrderStatus",required = false)String statusId,
                                @RequestParam(value = "pageIndex", required = false) String pageIndex){

        return "ry/query_ry";
    }


    //寄件服务


    /**
     *
     * @author: 任一
     * @Description 
     * @Date: 16:26 2018/10/4
     * @Param：Model,String(_cityId),String(_branchId)
     * @return：ry/send_ry
     * 进入寄件页面
     */
    @RequestMapping(value = "/intosend", method = RequestMethod.GET)
    public String intosend(Model model,
                           @RequestParam(value = "cityId", required = false) String _cityId,
                           @RequestParam(value = "branchId", required = false) String _branchId) {
        List<Organization> cityList = organizationService.filialeList();
        List<Dictionary> typeList = dictionaryService.selectGoodsStatus();
        model.addAttribute("typeList", typeList);
        model.addAttribute("cityList", cityList);

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
     *
     * @author: 任一
     * @Description 保存订单信息
     * @Date: 10:02 2018/10/5
     * @Param：Order_info(order_info),Model(model)
     * @return：
     */
    @RequestMapping(value = "/savesend",method = RequestMethod.POST)
    public String savesend (Order_info order_info,Model model){
        //订单号
        int num = (int)(Math.random()*9000)+1000;
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String orderNumber = order_info.getUserId()+ format.format(date)+ num;
        order_info.setOrderNumber(orderNumber);

        //订单状态
        order_info.setStatus(1);

        //创建时间
        order_info.setRiseTime(new Date());

        //执行添加
        try{
            if(order_infoService.insertSelective(order_info)){
                return "redirect:/wuliu/index";
            }else{
                model.addAttribute("sendErro","对不起，订单生成失败，请重试或联系管理员");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:calculate/intosend";
    }

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 16:28 2018/10/4
     * @Param：
     * @return：List<Organization>
     * ajax返回网点列表
     */
    @RequestMapping(value = "queryBranchList.json", method = RequestMethod.GET)
    @ResponseBody
    public List<Organization> queryBranchList(@RequestParam Integer parentId) {
        List<Organization> branchList = organizationService.selectByParentId(parentId);
        return branchList;
    }



    //站内信息


    //报表
}
