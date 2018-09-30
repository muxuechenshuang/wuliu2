package com.forest.wu.controller.filiale;

import com.forest.wu.pojo.Organization;
import com.forest.wu.service.WangDianService;
import com.forest.wu.utils.PageSupport;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 分公司控制层
 *
 * @author 李家和
 * @create 2018-09-29 15:17
 **/

@Controller
@RequestMapping("/filiale")
public class FilialeController {
    @Autowired
    private WangDianService wdService;

    @RequestMapping("/wd/query")
    public String getWdInfoList(Model model, @RequestParam(value = "id",required = false) String id,
                                @RequestParam(value = "name",required = false)String name,
                                @RequestParam(value = "phone",required = false)String phone,
                                @RequestParam(value = "pageIndex", required = false) String pageIndex){

        List<Organization> wdList = null;
        Integer wdId=null;
        String wdName=null;
        String wdPhone=null;
        if (!StringUtils.isEmpty(id)){
            wdId=Integer.parseInt(id);
        }
        if(!StringUtils.isEmpty(name)){
            wdName = name;
        }
        if(!StringUtils.isEmpty(phone)){
            wdPhone = phone;
        }
        try {
            Integer pageNum=1;
            PageHelper.startPage(pageNum, PageSupport.PAGE_SIZE);
            wdList = wdService.getWdListByCondition(wdId,wdName,wdPhone);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("wdList",wdList);
        return "ljh/wangdianchaxun";
    }

    public String wdInfo(){

        return "";
    }
}
