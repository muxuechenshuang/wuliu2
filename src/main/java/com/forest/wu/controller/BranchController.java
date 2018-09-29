package com.forest.wu.controller;

import com.forest.wu.dao.UserMapper;
import com.forest.wu.pojo.User;
import com.forest.wu.service.CourierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
   public String selectUser(Model model){
       List<User> listUser= courierService.selectUsers();
       model.addAttribute("listUser",listUser);
       System.out.print("李普强");
       System.out.print(listUser);
        return  "lpq/yuangong2";
    }

}
