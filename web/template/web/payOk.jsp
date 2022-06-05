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
<%@include file="phoneHeader.jsp" %>

<main class="pay-suc">
    <div class="payed-tip">
        <img src="img/pay_success.png">
        <span>您已成功付款</span>
    </div>
    <div class="payed-info">
        <ul>
            <li>收货地址： ${order.address} </li>
            <li>实付款：<span class="payed-num">￥${order.sum}</span></li>
        </ul>
    </div>
    <div class="payed-guide">
        您可以
        <a href="myOrder" class="payed-guide-link">查看已买到的宝贝</a>
    </div>
    <div class="payed-warning">
        <img src="img/warning.png">
        <b>安全提醒：</b>下单后，<span class="red-color bold-word">用QQ给您发送链接办理退款的都是骗子！</span>天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
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