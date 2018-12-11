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

//    跳转测试数据
    @RequestMapping("text")
    public String text(Model model){
        return "goods-add";
    }



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

    //跳转页面
    @RequestMapping("goodsadd")
    public String goodsadd(Model model){
        return "goods-add";
    }


    //    添加
    @RequestMapping("addgoods")
    public String addgoods(Model model,Goods goods){
        if(goods != null){
            goodsService.addGoods(goods);
        }
        return "redirect:/admin/goods/goodsInfo";
    }

    //    修改
    @RequestMapping("updategoods")
    public String updategoods(Model model,Goods goods){
        if(goodsService.updateGoods(goods)){
            goods = goodsService.selectgoodsBygid(goods.getGid());
            model.addAttribute("goods", goods);
            return "redirect:/admin/goods/goodsInfo";
        }
        return "error";
    }



    //    删除
    @RequestMapping("/delgoods")
    public String delgoods(String gid,Model model){
        model.addAttribute("goods", goodsService.deleteGoodsbyGid(gid));
        return "redirect:/admin/goods/goodsInfo";
    }

    //   多删除
    @RequestMapping("/deletes")
    public String deletes(Model model, @RequestParam("ids") List<String> gids){

        String msg="删除成功！";

        if(goodsService.deletegoodsbyList(gids)==false){
            msg="删除失败！";
        }

        model.addAttribute("goods",goodsService.selectAllGoods(""));
        return "redirect:/admin/goods/goodsInfo";
    }




}
