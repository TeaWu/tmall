<%--
  Created by IntelliJ IDEA.
  User: littlestar
  Date: 2022/6/3
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>果蔬超市</title>

    <link rel="stylesheet" href="css/web_css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/web_css/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/web_css/ionicons.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/web_css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/web_css/owl.theme.css" type="text/css" media="all">
    <link rel='stylesheet' href='css/web_css/prettyPhoto.css' type='text/css' media='all'>
    <link rel="stylesheet" href="css/web_css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/web_css/custom.css" type="text/css" media="all">
    <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i"
          rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.5.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.5.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<%@include file="loginBar.jsp"%>
<!-- 引入公共的头部导航条 -->
<%@include file="header.jsp"%>
<body>

<%@include file="phoneHeader.jsp" %>

<main class="order-list">
<div class="panel-body">
   <form class="form-horizontal" method="post" id="add-form" action="user_Update" enctype="multipart/form-data">
       <div class="form-group">
           <label for="name" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入昵称" value="${u.name}">
                        </div>
                    </div>
                    <div class="form-group">
                         <label for="receiver" class="col-sm-2 control-label">收货人</label>
                         <div class="col-sm-10">
                         <input type="text" class="form-control" id="receiver" name="receiver"
                         placeholder="请输入收件人名称" value="${u.receiver}">
                         </div>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="mobile" name="mobile"
                                   placeholder="请输入手机号" value="${u.mobile}">
                        </div>
                    </div>
                    <div class="form-group">
                         <label for="address" class="col-sm-2 control-label">收货地址</label>
                         <div class="col-sm-10">
                             <input type="text" class="form-control" id="address" name="address"
                                   placeholder="请输入收获地址" value="${u.address}">
                         </div>
                    </div>
                    <input type="hidden" id="id" name="id" value="${u.id}">

                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">保存</button>
                        </div>
                    </div>
                </form>
            </div>

</main>


<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="js/web_js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/web_js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/web_js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/web_js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/web_js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/web_js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/web_js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/web_js/script.js"></script>

<script type="text/javascript" src="js/web_js/core.min.js"></script>
<script type="text/javascript" src="js/web_js/widget.min.js"></script>
<script type="text/javascript" src="js/web_js/mouse.min.js"></script>
<script type="text/javascript" src="js/web_js/slider.min.js"></script>
<script type="text/javascript" src="js/web_js/jquery.ui.touch-punch.js"></script>
<script type="text/javascript" src="js/web_js/price-slider.js"></script>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script src="js/MyLayuiUtils.js" charset="utf-8"></script>
</body>
<%@include file="footer.jsp"%>
</html>