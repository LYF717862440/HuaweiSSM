<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../lib/html5shiv.js"></script>
    <script type="text/javascript" src="../../lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../CSS/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../../static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../../static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script type="text/javascript" src="../../JS/bootstrap.min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <style type="text/css">
        .txtstyle{
            width: 120px;
            height: 31px;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i><span class="c-gray en"></span>商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c"> <!--日期范围：-->
        <!--<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
        --->
        <!--<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
        <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="">-->
        <form>
        <label for="txtGtype">商品类型：</label><input type="text" class="txtstyle" name="txtGtype" id="txtGtype"/>
        <label for="txtname">商品名称：</label><input type="text" value="${gname}" class="txtstyle" name="name" id="txtname"/>
        <label for="txtprice">商品价格：</label><input type="text" class="txtstyle" name="txtprice" id="txtprice"/>-<input type="text" class="txtstyle" name="txtprice" />
        <button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索商品</button>
        </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add('添加商品','goodsadd','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a></span> <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span> </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="12">商品列表</th>
        </tr>
        <tr class="text-c">
            <th width="30"><input type="checkbox" name="" value=""></th>
            <th width="40">ID</th>
            <th width="80">商品名称</th>
            <th width="60">商品类型</th>
            <th width="50">价格</th>
            <%--<th width="60">商品说明</th>--%>
            <th width="80">颜色</th>
            <th width="40">版本</th>
            <%--<th width="60">详细</th>--%>
            <%--<th width="80">是否已启用</th>--%>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id="tbody_goodslist">
        <c:forEach items="${pageInfo.list}" var="goods">
            <tr class="text-c">
                <td><input type="checkbox" value="1" name=""></td>
                <td>${goods.gid}</td>
                <td>${goods.gname}</td>
                <td>${goods.gtype}</td>
                <td>${goods.gprice}</td>
                <%--<td>${goods.gexplain}</td>--%>
                <td>${goods.colour}</td>
                <td>${goods.versions}</td>
                <%--<td>${goods.details}</td>--%>
                <%--<td>${goods.gstate}</td>--%>
                <%--<td class="td-status"><span class="label label-success radius">已启用</span></td>--%>
                <td class="td-manage"><a style="text-decoration:none" onclick="users_show(${goods.gimg},${goods.gexplain},${goods.details},${goods.stock},${goods.gstate})" href="#" title=""><i class="Hui-iconfont">&#xe631;</i></a><a title="编辑" href="javascript:;" onclick="admin_edit('商品编辑','goodsadd','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>

<hr style="height:1px;border:none;border-top:1px solid #ccc;" />
<!-- 分页导航栏 -->

<!-- 分页信息 -->
<div class="row">
    <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
    <div class="col-md-6">
        当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页
    </div>

    <!-- 分页条 -->
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="goodsInfo?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="goodsInfo?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num == pageInfo.pageNum}">
                        <li class="active"><a href="#">${ page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != pageInfo.pageNum}">
                        <li><a href="goodsInfo?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="goodsInfo?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="goodsInfo?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<link rel="stylesheet" href="../../CSS/dialog.css">
<script type="text/javascript" src="../../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="../../JS/dialog-min.js"></script>
<script type="text/javascript">

    function users_show(gimg,gexplain,details,stock,gstate){
        var d = dialog({
            title: '消息',
            content: '<p>编号<input id="id" autofocus value="'+gimg+'"/></p><p>姓名<input id="name" autofocus /></p><p>性别<select id="sex"><option value="男">男</option></select></p>',
            okValue: '确 定',
            ok: function() {

                var that = this;
                setTimeout(function() {
                    that.title('提交中..');
                }, 2000);
                return false;
            },
            cancelValue: '取消',
            cancel: function() {
                alert('你点了取消按钮');
            }
        });
    }




    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    // /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    // /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……


            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }
</script>
</body>
</html>
