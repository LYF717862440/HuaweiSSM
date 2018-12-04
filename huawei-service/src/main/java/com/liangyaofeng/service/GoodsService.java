package com.liangyaofeng.service;

import com.liangyaofeng.entity.Goods;

import java.util.List;

public interface GoodsService {


    List<Goods> selectAllGoods(String gname);

    boolean addGoods(Goods goods);

    boolean updateGoods(Goods goods);

    boolean deleteGoodsbyGid(Goods goods);


}
