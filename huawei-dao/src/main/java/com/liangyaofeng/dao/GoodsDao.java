package com.liangyaofeng.dao;

import com.liangyaofeng.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {

    List<Goods> selectAllGoods(@Param("gname")String gname);

    boolean addGoods(Goods goods);

    boolean updateGoods(Goods goods);

    boolean deleteGoodsbyGid(String loginId);


}
