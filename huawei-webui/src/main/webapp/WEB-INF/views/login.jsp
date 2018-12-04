<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>华为后台登录</title>
    <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>JSP Page</title>
    <link rel="stylesheet" href="../../CSS/logocss/pintuer.css">
    <link rel="stylesheet" href="../../CSS/logocss/admin.css">
    <script src="../../JS/logojs/jquery.js"></script>
    <script src="../../JS/logojs/pintuer.js"></script>
</head>

<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="index-2.html" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top">
                        <h1>华为后台登录</h1></div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" id="loginId" name="loginId" placeholder="登录账号" data-validate="required:请填写账号" />
                                <span id="spanloginId" class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" id="password" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span id="spanpassword" class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                <img src="../../img/logoimg/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">

                            </div>
                        </div>
                    </div>
                    <div style="padding:30px;"><input type="button" class="button button-block bg-main text-big input-big" value="登录" id="login_on"></div>
                </div>
            </form>
        </div>
    </div>
</div>

<script rel="stylesheet" src="../../JS/jquery-1.10.2.min.js"></script>
<script>


    $(function(){
        $("#login_on").click(function(){
            //清空数据
            // $("#spanloginId").html(" ");
            // $("#spanpassword").html(" ");
            //检查数据格式
            // var ok =true;
            //获取请求数据
            var loginId=$("#loginId").val().trim();
            var password = $("#password").val().trim();
            // if(loginId==""){
            //     $("#spanloginId").html("用户名不能为空");
            //     alert("用户名不能为空");
            //     ok=false;
            //     return ok;
            // }else{
            //     if(password==""){
            //         $("#spanpassword").html("密码不能为空");
            //         alert("密码不能为空");
            //         ok=false;
            //         return ok;
            //     }
            // }


            // if(ok){
                //发送Ajax请求
                $.ajax({
                    url:"/admin/checklogin",
                    type:"post",
                    data:{"loginId":loginId,"password":password},
                    dataType:"json",
                    success:function(result){
                        //result是服务器返回的json结果
                        if(result.status==0){  //登录成功
                            var username = result.data;
                            // addCookie("uid",username,4);//存储2小时
                            alert("登录成功");
                            sessionStorage.setItem("loginId",loginId);
                            window.location.href = "http://localhost:8080/admin/toindex";
                        }else if (result.status==1){  //用户名不存在
                            // $("#spanloginId").html(result.msg);
                            alert(result.msg);

                        }else if(result.status==2){  //密码不正确
                            // $("#spanpassword").html(result.msg);
                            alert(result.msg);
                        }
                    }
                });
            // }
        });
    });



</script>

</body>
</html>