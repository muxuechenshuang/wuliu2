package com.forest.wu.controller;

import com.forest.wu.pojo.Organization;
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

    @RequestMapping(value = "/branchquery",method = RequestMethod.GET)
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
        }else{
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

        model.addAttribute("cityList", cityList);
        model.addAttribute("branchList",branchList);
        model.addAttribute("cityId", cityId);
        model.addAttribute("pages",pages);
        return "ry/branchquery_ry";
    }


    //查件


    //寄件服务


    //站内信息


    //报表
}
