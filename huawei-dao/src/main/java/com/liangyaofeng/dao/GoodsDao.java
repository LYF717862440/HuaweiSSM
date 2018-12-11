package com.liangyaofeng.dao;

import com.liangyaofeng.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {

    List<Goods> selectAllGoods(@Param("gname")String gname);

    Goods selectgoodsBygid(@Param("gid")String gid);

    boolean addGoods(Goods goods);

    boolean updateGoods(Goods goods);

    boolean deleteGoodsbyGid(String gid);

    boolean deletegoodsbyList(List<String> gids);


}
