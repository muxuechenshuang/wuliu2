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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    /**
    * @author: 李家和
    * @Description 查询网点
    * @Date: 17:18 2018/9/30
    * @Param：[model, id, name, phone, pageIndex]
    * @return：java.lang.String
    **/
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
            wdName = name;
        }
        if(!StringUtils.isEmpty(phone)){
            wdPhone = phone;
        }
        if(!StringUtils.isEmpty(pageIndex)){
            pageNum = Integer.parseInt(pageIndex);
        }

            //分页
            PageHelper.startPage(pageNum, Constants.PAGE_SIZE);
            wdList = wdService.getWdListByCondition(wdId,wdName,wdPhone);
            PageInfo<Organization> p = new PageInfo<Organization>(wdList);
            model.addAttribute("page",p);
            model.addAttribute("wdList",wdList);
            model.addAttribute("queryWdId",wdId);
            model.addAttribute("queryWdName",wdName);
            model.addAttribute("queryWdPhone",wdPhone);

        return "ljh/wdquery";
    }

    /**
    * @author: 李家和
    * @Description 查看网点详情
    * @Date: 17:19 2018/9/30
    * @Param：[id, model]
    * @return：java.lang.String
    **/
    @RequestMapping(value="/wd/view/{id}",method = RequestMethod.GET)
    public String wdInfo(@PathVariable String id,Model model){
        Organization organization = null;
        if(!StringUtils.isEmpty(id)){
            organization = wdService.getWdById(Integer.parseInt(id));
        }
        model.addAttribute(organization);
        return "ljh/wdinfo";
    }
}
