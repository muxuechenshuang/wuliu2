package com.forest.wu.controller;

import com.forest.wu.dao.UserMapper;
import com.forest.wu.pojo.User;
import com.forest.wu.service.CourierService;
import com.forest.wu.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 网点
 *
 * @author 李普强
 * @create 2018-09-29 9:34
 **/
@Controller
@RequestMapping(value = "/wuliu")
public class BranchController {
    @Autowired
    private CourierService  courierService;
    @RequestMapping(value = "/list")
    public String selectUser(Model model, @RequestParam(value = "id",required = false) String id,
                             @RequestParam(value = "username",required = false) String username,
                             @RequestParam(value = "phone",required = false) String phone,
                             @RequestParam(value = "email" ,required = false) String email,
                             @RequestParam(value = "pageIndex",required = false) String pageIndex){
        Integer pageNo=1;//当前页
        Integer pageSize=5;//页大小
        if(pageIndex!=null){
            pageNo=Integer.valueOf(pageIndex);
        }

        if(id==null){
            id="";
        }
        if(username==null){
            username="";
        }
        if(phone==null){
            phone="";
        }
        if(email==null){
            email="";
        }

        int count=0;//总记录数
        count=courierService.count(id,username,phone,email);
        Page page=new Page();
        page.setPageSize(pageSize);
        page.setPageNo(pageNo);
        page.setCount(count);
        int pageCount=page.getPageCount();
        //控制首尾页
        if(pageNo<1){
            pageNo=1;
        }else if(pageNo>pageCount){
            pageNo=pageCount;
        }

        Integer pageNos=(pageNo-1)*pageSize;

        List<User> listUser= courierService.selectUsers(id,username,phone,email,pageNos,pageSize);
        model.addAttribute("listUser",listUser);
        model.addAttribute("page",page);
        System.out.print("李普强");
        System.out.print(listUser);
        return  "lpq/yuangong2";
    }

}
