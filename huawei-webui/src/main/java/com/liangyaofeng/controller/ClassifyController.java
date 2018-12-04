package com.liangyaofeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liangyaofeng.entity.Classify;
import com.liangyaofeng.entity.Goods;
import com.liangyaofeng.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("admin/classify")
public class ClassifyController {

    @Autowired
    ClassifyService classifyService;

//    测试跳转页面
@RequestMapping("classifyInfo")
public String classifyInfo(@RequestParam(required=true,defaultValue="1") Integer pn,
                        @RequestParam(required=false,defaultValue="5") Integer pageSize, Model model){
    //从第一条开始 每页查询五条数据
    PageHelper.startPage(pn, pageSize);
    List<Classify> list = classifyService.selectAllClassify();
    //将用户信息放入PageInfo对象里
    PageInfo<Classify> page = new PageInfo<Classify>(list,pageSize);
    model.addAttribute("pageInfo", page);
    return "classify-list";
}



}
