package com.liangyaofeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liangyaofeng.entity.Users;
import com.liangyaofeng.service.UsersServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("admin/users")
public class UsersController {


    @Autowired
    UsersServie usersServie;


    @RequestMapping("usersInfo")
    public String goodsInfo(@RequestParam(required=true,defaultValue="1") Integer pn,
                            @RequestParam(required=false,defaultValue="5") Integer pageSize, Model model, String loginId,String uname){
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, pageSize);
        List<Users> users = usersServie.selectAllUsers(loginId, uname);
        //将用户信息放入PageInfo对象里
        PageInfo<Users> page = new PageInfo<Users>(users,pageSize);
        model.addAttribute("pageInfo", page);
        model.addAttribute("loginId",loginId);
        model.addAttribute("uname",uname);
        return "users-list";
    }

    //跳转到登录页面
    @RequestMapping("usersadd")
    public String usersadd(Model model){
        return "users-add";
    }





}
