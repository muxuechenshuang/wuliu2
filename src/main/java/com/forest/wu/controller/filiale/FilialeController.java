package com.forest.wu.controller.filiale;

import com.forest.wu.pojo.Organization;
import com.forest.wu.pojo.User;
import com.forest.wu.service.WangDianService;
import com.forest.wu.utils.Constants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
    private Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * @author: 李家和
     * @Description 查询该分公司下的网点
     * @Date: 17:18 2018/9/30
     * @Param：[model, id, name, phone, pageIndex]
     * @return：java.lang.String
     **/
    @RequestMapping("/wdquery")
    public String getWdInfoList(Model model, HttpSession session,
                                @RequestParam(value = "queryWdId", required = false) String id,
                                @RequestParam(value = "queryWdName", required = false) String name,
                                @RequestParam(value = "queryWdPhone", required = false) String phone,
                                @RequestParam(value = "pageIndex", required = false) String pageIndex) {

        List<Organization> wdList = null;
        //获得网点所属分公司的id
        Integer parentId = ((User) session.getAttribute("user")).getParentid();
        Integer wdId = null;
        String wdName = null;
        String wdPhone = null;
        Integer pageNum = 1;
        if (!StringUtils.isEmpty(id)) {
            wdId = Integer.parseInt(id);
        }
        if (!StringUtils.isEmpty(name)) {
            wdName = name;
        }
        if (!StringUtils.isEmpty(phone)) {
            wdPhone = phone;
        }
        if (!StringUtils.isEmpty(pageIndex)) {
            pageNum = Integer.parseInt(pageIndex);
        }

        //分页
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE, "id desc");
        wdList = wdService.getWdListByCondition(wdId, wdName, wdPhone, parentId);
        PageInfo<Organization> p = new PageInfo<Organization>(wdList);
        model.addAttribute("page", p);
        model.addAttribute("wdList", wdList);
        model.addAttribute("queryWdId", wdId);
        model.addAttribute("queryWdName", wdName);
        model.addAttribute("queryWdPhone", wdPhone);

        return "ljh/wdquery";
    }

    /**
     * @author: 李家和
     * @Description 查看网点详情
     * @Date: 17:19 2018/9/30
     * @Param：[id, model]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/wd/view/{id}", method = RequestMethod.GET)
    public String wdInfo(@PathVariable String id, Model model) {
        Organization organization = new Organization();
        organization.setId(Integer.parseInt(id));
        organization = wdService.getWd(organization);
        model.addAttribute(organization);
        return "ljh/wdinfo";
    }


    /**
     * @author: 李家和
     * @Description 修改网点信息
     * @Date: 10:31 2018/10/2
     * @Param：[id, model]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/wd/modify/{id}", method = RequestMethod.GET)
    public String wdModify(@PathVariable String id, Model model) {
        Organization organization = new Organization();
        organization.setId(Integer.parseInt(id));
        if (!StringUtils.isEmpty(id)) {
            organization = wdService.getWd(organization);
        }
        model.addAttribute(organization);
        return "ljh/wdmodify";
    }


    /**
     * @author: 李家和
     * @Description 跳转到增加网点页面
     * @Date: 11:12 2018/10/2
     * @Param：[organization]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/wdinfoadd", method = RequestMethod.GET)
    public String addWd(Organization wd, HttpSession session, Model model) {
        Integer id = ((User) session.getAttribute("user")).getParentid();
        Organization sonCompany = null;
        sonCompany = wdService.getSonCompanyById(id);
        if (!StringUtils.isEmpty(sonCompany)) {
            model.addAttribute("company", sonCompany);
        }
        model.addAttribute("wdinfo", wd);
        return "ljh/wdadd";
    }


    /**
     * @author: 李家和
     * @Description 保存wdinfo信息
     * @Date: 14:13 2018/10/2
     * @Param：[wd, session, request]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/wdaddsave", method = RequestMethod.POST)
    public String addWdSave(Organization wd, HttpSession session) {
        Integer parentId = ((User) session.getAttribute("user")).getParentid();
        //设置所属分公司Id
        wd.setParentId(parentId);
        wd.setType(3);
        try {
            if (wdService.addWd(wd)) {
                //添加成功
                return "redirect:/filiale/wdquery";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //添加失败
        return "ljh/wdadd";
    }


    /**
     * @author: 李家和
     * @Description Ajax验证网点名称是否存在
     * @Date: 16:14 2018/10/4
     * @Param：[wdName]
     * @return：java.lang.Object
     **/
    @RequestMapping(value = "nameisexist.json", method = RequestMethod.GET)
    @ResponseBody
    public Object wdNameIsExist(@RequestParam("wdName") String wdName, HttpSession session) {
        Integer parentId = ((User) session.getAttribute("user")).getParentid();
        HashMap<String, Object> map = new HashMap<String, Object>();
        logger.info("wdname===========" + wdName);
        List<Organization> list = null;
        list = wdService.getWdListByCondition(null, wdName, null, parentId);
        if (!list.isEmpty()) {
            map.put("wdName", "exist");
        } else {
            map.put("wdName", "noexist");
        }
        return map;
    }


    /**
     * @author: 李家和
     * @Description 修改网点信息
     * @Date: 8:14 2018/10/5
     * @Param：[id, model]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/modifyWd", method = RequestMethod.GET)
    public String modifyWdInfo(@RequestParam("id") String id, @RequestParam("parentId") String parentId, Model model) {
        logger.info("id===========" + id);
        Organization wd = new Organization();
        wd.setId(Integer.parseInt(id));
        wd.setParentId(Integer.parseInt(parentId));
        try {
            wd = wdService.getWd(wd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("wd", wd);
        return "ljh/wdmodify";
    }


    /**
     * @author: 李家和
     * @Description 保存网点修改的信息
     * @Date: 9:10 2018/10/5
     * @Param：[wd, session]
     * @return：java.lang.String
     **/
    @RequestMapping(value = "/wdinfomodifysave", method = RequestMethod.POST)
    public String modifyWdInfoSave(Organization wd, HttpSession session) {
        Integer parentId = ((User) session.getAttribute("user")).getParentid();
        //设置所属分公司Id
        wd.setParentId(parentId);
        wd.setType(3);
        if (wdService.modifyWd(wd)) {
            return "redirect:/filiale/wdquery";
        }
        return "ljh/wdmodify";
    }


    /**
    * @author: 李家和
    * @Description 删除网点(两个条件：该网点订单数为0并且快递员数量为0)
    * @Date: 10:20 2018/10/5
    * @Param：[id]
    * @return：java.lang.String
    **/
    @RequestMapping(value = "delwd.json",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteWd(@Param("id") String id){
        logger.info("delwd==================>"+id);
        HashMap<String, Object> map = new HashMap<String, Object>();
        if(StringUtils.isEmpty(id)){
            map.put("result","null");
        }else{
            Integer wdId = Integer.parseInt(id);
            //判断是否存在订单
            if(wdService.getOrderCountByWdId(wdId)>0){
                //判断是否存在快递员
                if(wdService.getUserCountByWdId(wdId)>0){
                    if(wdService.delWdById(wdId)){
                        //删除成功
                        map.put("result","success");
                    }
                }else{
                    //存在快递员，不能删
                    map.put("result","hasuser");
                }
            }else{
                //存在订单，不能删
                map.put("result","hasorder");
            }
        }
        return map;
    }

}
