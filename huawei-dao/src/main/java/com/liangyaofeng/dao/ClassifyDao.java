package com.liangyaofeng.dao;

import com.liangyaofeng.entity.Classify;

import java.util.List;

public interface ClassifyDao {

    List<Classify> selectAllClassify();

    boolean addClassify(Classify classify);

    boolean updateClassify(Classify classify);

    boolean deleteClassify(String cid);


}
