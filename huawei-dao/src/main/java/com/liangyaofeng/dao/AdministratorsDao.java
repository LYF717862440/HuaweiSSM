package com.liangyaofeng.dao;

import com.liangyaofeng.entity.Administrators;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.LineInputStream;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdministratorsDao {

     List<Administrators> selectAllAdmin();

     Administrators selectAllbyloginId(@Param("loginId")String loginId);

     boolean addAdministrators(Administrators administrators);

     boolean deleteAdministrators(@Param("loginId") String loginId);

     boolean updateAdministrators(Administrators administrators);



}
