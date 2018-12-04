package com.liangyaofeng.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liangyaofeng.entity.Administrators;
import com.liangyaofeng.entity.Classify;
import com.liangyaofeng.entity.NoteResult;
import com.liangyaofeng.service.AdministratorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Controller
@RequestMapping("admin")
public class administratorsController {

    @Autowired
    AdministratorsService administratorsService;

//    跳转到后台首页页面
    @RequestMapping("toindex")
    public String toindex(Model model){
        return "index";
    }


    //跳转到登录页面
    @RequestMapping("tologin")
    public String tologin(Model model){
        return "login";
    }


    //查询，登录验证账号
    @RequestMapping("/checklogin")
    @ResponseBody
    public NoteResult execute(String loginId, String password, HttpSession session) throws NoSuchAlgorithmException {
        session.setAttribute("loginId",loginId);
        NoteResult result = administratorsService.checkLogin(loginId,password);
        return result;
    }



    //    测试跳转页面
    @RequestMapping("adminInfo")
    public String adminInfo(@RequestParam(required=true,defaultValue="1") Integer pn,
                               @RequestParam(required=false,defaultValue="5") Integer pageSize, Model model){
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, pageSize);
        List<Administrators> list = administratorsService.selectAllAdmin();
        //将用户信息放入PageInfo对象里
        PageInfo<Administrators> page = new PageInfo<Administrators>(list,pageSize);
        model.addAttribute("pageInfo", page);
        return "admin-list";
    }


    //跳转到产品管理页面
    @RequestMapping("togoods")
    public String togoods(Model model){
        return "goods-list";
    }

    //跳转到类型管理页面
    @RequestMapping("toclassify")
    public String toclassify(Model model){
        return "classify-list";
    }


    //跳转到管理员管理页面
    @RequestMapping("toadmin_list")
    public String toadmin_list(Model model){
        return "admin-list";
    }



}
