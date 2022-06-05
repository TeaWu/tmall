<%--
  Created by IntelliJ IDEA.
  User: byqs
  Date: 2022/2/20
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头部导航条</title>
</head>
<body>
<header id="header" class="header header-desktop header-2">
    <div class="top-search">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <form>
                        <input type="search" class="top-search-input" name="s" placeholder="What are you looking for?"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <a href="home" id="logo">
                    <img class="logo-image" src="images/logo.png" alt="Organik Logo"/>
                </a>
            </div>
            <div class="col-md-9">
                <div class="header-right">
                    <nav class="menu">
                        <ul class="main-menu">
                            <li><a href="home">首页</a></li>
                            <li><a href="shop">商城</a></li>
                            <li><a href="notice">公告</a></li>
                            <li><a href="cart">购物车</a></li>
                            <%--                            <jsp:useBean id="user" scope="request" type="bean.User"/>--%>
                            <c:if test="${!empty user}">
                                <li><a href="myOrder">我的订单</a></li>
                                <li><a href="message">我的留言</a></li>
                            </c:if>
                            <c:if test="${user.group=='superAdmin'||'admin'}">
                                <li><a href="admin" target="_blank">网站后台</a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <div class="btn-wrap">
                        <div class="mini-cart-wrap">
                            <div class="mini-cart">
                                <div class="mini-cart-icon" id="cartTips"
                                     data-count="${sessionScope.cartListCount != null ?
                                                       sessionScope.cartListCount : 0}">
                                    <i class="ion-bag"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
</body>
<script src="js/jquery-3.5.1.js" charset="utf-8"></script>
<script src="lib/layer/layer.js" charset="utf-8"></script>
<script src="js/MyLayuiUtils.js" charset="utf-8"></script>
<script src="js/web_js/myWebJs/cart.js" charset="utf-8"></script>
</html>
