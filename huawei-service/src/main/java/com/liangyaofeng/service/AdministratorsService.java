package com.liangyaofeng.service;

import com.liangyaofeng.entity.Administrators;
import com.liangyaofeng.entity.NoteResult;
import org.apache.ibatis.annotations.Param;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface AdministratorsService {

//    登录
    public NoteResult checkLogin(String loginId, String password) throws NoSuchAlgorithmException;

    List<Administrators> selectAllAdmin();

    Administrators selectAllbyloginId(String loginId);

    boolean addAdministrators(Administrators administrators);

    boolean deleteAdministrators(@Param("loginId") String loginId);

    boolean updateAdministrators(Administrators administrators);


}
