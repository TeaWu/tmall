<%--
  Created by IntelliJ IDEA.
  User: littlestar
  Date: 2022/5/31
  Time: 22:27
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


<main class="comment">
  <div class="comment-left-jpg">
    <img src="pictures/product/${orderItem.product.firstProductImage.id}.jpg">
  </div>
  <div class="comment-right-detail">
    <div class="comment-detail-title">
      ${orderItem.product.name}
    </div>
    <table class="comment-detail">
      <tr>
        <td width="100px">价格</td>
        <td><span class="comment-price">${orderItem.product.nowPrice}</span>元</td>
      </tr>
      <tr>
        <td>配送</td>
        <td><span class="comment-deliver">卖家承担运费</span></td>
      </tr>
    </table>
    <div class="comment-time">
      <div class="comment-time-png"></div>
      <div class="comment-time-text">现在查看的是 您所购买商品的信息<br> 于${order.createDate}下单购买了此商品</div>
    </div>
  </div>
  <div class="comment-bar clear">
    <div class="comment-bar-text">
      累计评价<em>${orderItem.product.commentCount}</em>
    </div>
    <div class="comment-bar-bottom"></div>
  </div>
  <div class="comment-form">
    <form class="inner-form" action="addComment">
      <div class="comment-tip">
        其他买家，需要你的建议哦！
      </div>
      <table class="comment-table">

        <tr>
          <td class="left-col">评价商品</td>
          <td class="right-col"><textarea name="content"></textarea></td>
          <input type="hidden" name="oiid" value="${orderItem.id}">
        </tr>
      </table>
      <div class="comment-bottom">
        <button type="submit" class="comment-button">提交评价</button>
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
