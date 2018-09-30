package com.forest.wu.controller;

import com.forest.wu.service.OrganizationService;
import com.forest.wu.utils.CalculateMoneyEstimate;
import com.forest.wu.utils.DistanceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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


    @RequestMapping("/page")
    public String intoPage(Model model) {
        List<String> cityList = organizationService.cityList();
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
        map.put("time", time);
        map.put("money", money);
        return map;
    }


    //服务网点查询


    //查件


    //寄件服务


    //站内信息


    //报表
}
