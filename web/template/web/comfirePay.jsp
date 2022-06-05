<%--
  Created by IntelliJ IDEA.
  User: littlestar
  Date: 2022/5/31
  Time: 21:57
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


<main class="confirm-pay">
    <div class="buy-flow-img">
        <img src="img/buyflow_3.png">
    </div>
    <div class="buy-flow">
        <div class="buy-flow-time time-1">${order.createDate}</div>
        <div class="buy-flow-time time-2">${order.payDate}</div>
        <div class="buy-flow-time time-3">${order.deliverDate}</div>
    </div>
    <div class="agree-pay-text">我已收到货，同意支付宝付款</div>
    <div class="bill-detail">
        <div class="bill-detail-title">订单信息</div>
        <table class="bill-detail-table">
            <thead>
            <tr>
                <th colspan="2">宝贝</th>
                <th>单价</th>
                <th>数量</th>
                <th>商品总价</th>
                <th>运费</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.orderItems}" var="oi" varStatus="vs">
                <tr>
                    <td><img src="pictures/product/${oi.product.firstProductImage.id}.jpg"></td>
                    <td class="item-title"><a href="#nowhere">${oi.product.name}</a></td>
                    <td>￥${oi.product.nowPrice}</td>
                    <td>${oi.number}</td>
                    <td class="item-sum-price">￥${oi.sum}</td>
                    <td>快递 0.00</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="bill-detail-sum">实付款： <span class="red-color">￥${order.sum}</span></div>
        <table class="pay-detail-table clear">
            <tbody>
            <tr>
                <td width="200px">订单编号：</td>
                <td>${order.orderCode} </td>
            </tr>
            <tr>
                <td width="200px">卖家昵称：</td>
                <td>果蔬超市</td>
            </tr>
            <tr>
                <td width="200px">收货信息： </td>
                <td>${order.address}，${order.receiver}， ${order.mobile}</td>
            </tr>
            <tr>
                <td width="200px">成交时间：</td>
                <td>${order.createDate}</td>
            </tr>
            </tbody>
        </table>
        <div class="confirm-end">
            <div class="confirm-warning">请收到货后，再确认收货！否则您可能钱货两空！</div>
            <a href="confirmed?oid=${order.id}"><button >确认支付</button></a>
        </div>
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
