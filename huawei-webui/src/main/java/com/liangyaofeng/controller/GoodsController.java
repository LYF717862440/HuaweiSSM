package com.liangyaofeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liangyaofeng.entity.Goods;
import com.liangyaofeng.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("admin/goods")
public class GoodsController {

    @Autowired
    GoodsService goodsService;


    @RequestMapping("goodsInfo")
    public String goodsInfo(@RequestParam(required=true,defaultValue="1") Integer pn,
                              @RequestParam(required=false,defaultValue="5") Integer pageSize, Model model, String gname){
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, pageSize);
        List<Goods> goods = goodsService.selectAllGoods(gname);
        //将用户信息放入PageInfo对象里
        PageInfo<Goods> page = new PageInfo<Goods>(goods,pageSize);
        model.addAttribute("pageInfo", page);
        model.addAttribute("gname",gname);
        return "goods-list";
    }



}
