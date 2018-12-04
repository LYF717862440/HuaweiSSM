package com.liangyaofeng.test;

import com.liangyaofeng.dao.GoodsDao;
import com.liangyaofeng.entity.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class GoodsDaoTest {

    @Autowired
    GoodsDao goodsDao;


    @Test
    public void test(){
        List<Goods> list=goodsDao.selectAllGoods("荣耀");
        System.out.println(list);
    }


}
