package com.forest.wu.controller.filiale;

import com.forest.wu.pojo.Organization;
import com.forest.wu.service.WangDianService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    public String getWdInfoList(Model model, @RequestParam(value = "queryWdId",required = false) String id,
                                @RequestParam(value = "queryWdName",required = false)String name,
                                @RequestParam(value = "queryWdPhone",required = false)String phone,
                                @RequestParam(value = "pageIndex", required = false) String pageIndex){

        List<Organization> wdList = null;
        Integer wdId=null;
        String wdName=null;
        String wdPhone=null;
        Integer pageNum=1;
        if (!StringUtils.isEmpty(id)){
            wdId=Integer.parseInt(id);
        }
        if(!StringUtils.isEmpty(name)){
            wdName = "%"+name+"%";
        }
        if(!StringUtils.isEmpty(phone)){
            wdPhone = phone;
        }
        if(!StringUtils.isEmpty(pageIndex)){
            pageNum = Integer.parseInt(pageIndex);
        }
        try {
            //分页
            PageHelper.startPage(pageNum, Constants.PAGE_SIZE);
            wdList = wdService.getWdListByCondition(wdId,wdName,wdPhone);
            PageInfo<Organization> p = new PageInfo<Organization>(wdList);
            model.addAttribute("page",p);
            model.addAttribute("wdList",wdList);
            model.addAttribute("queryWdId",wdId);
            model.addAttribute("queryWdName",wdName);
            model.addAttribute("queryWdPhone",wdPhone);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ljh/wangdianchaxun";
    }

    public String wdInfo(){

        return "";
    }
}
