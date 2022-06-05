<%--
  Created by IntelliJ IDEA.
  User: byqs
  Date: 2022/2/23
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="menu-slideout" class="slideout-menu hidden-md-up">
    <div class="mobile-menu">
        <ul id="mobile-menu" class="menu">
            <li><a href="home">首页</a></li>
            <li><a href="webSystem/toShopPage">商城</a></li>
            <li><a href="cart">购物车</a></li>
            <c:if test="${user != null}">
                <li><a href="">个人中心</a></li>
            </c:if>
            <li><a href="webSystem/toContactPage">联系我们</a></li>
            <li><a href="admin">网站后台</a></li>
        </ul>
    </div>
</div>
</body>
</html>
