package com.liangyaofeng.service.Impl;

import com.liangyaofeng.dao.GoodsDao;
import com.liangyaofeng.entity.Goods;
import com.liangyaofeng.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService{


    @Autowired
    GoodsDao goodsDao;


    public List<Goods> selectAllGoods(String gname) {
        if (StringUtils.isEmpty(gname)){
            gname=null;
        }
        return goodsDao.selectAllGoods(gname);
    }

    public boolean addGoods(Goods goods) {
        return false;
    }

    public boolean updateGoods(Goods goods) {
        return false;
    }

    public boolean deleteGoodsbyGid(Goods goods) {
        return false;
    }
}
