<%--
  Created by IntelliJ IDEA.
  User: byqs
  Date: 2022/2/20
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>果蔬超市</title>
</head>
<body>
<div class="topbar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="topbar-text">
                    <span>工作时间：周一 &nbsp;至&nbsp; 周五&nbsp;:&nbsp; 06AM - 06PM</span>
                    <span>周六 &nbsp;至&nbsp; 周日&nbsp;:&nbsp; 08AM - 06PM</span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="topbar-menu">
                    <ul class="topbar-menu">
                        <c:if test="${user == null}">
                            <li><a href="login">登陆/注册</a></li>
                        </c:if>
                        <c:if test="${user != null}">
                            <li><i class="fa fa-user"></i>&nbsp;&nbsp;
                                <a href="me">欢迎您：${user.name}</a>
                            </li>
                            <li><a href="javascript:" id="loginOutBtn">退出</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['layer'], function () {
        let layer = layui.layer
        $ = layui.jquery;

        $(function () {
            // 退出按钮绑定单机事件
            $("#loginOutBtn").click(function () {
                $.get(
                    "logout",
                    function (res) {
                        if (res == 'success') {
                            layer.msg('退出成功', {icon: 1});
                            setTimeout(function () {
                                window.location.href = "home";
                            }, 1000);
                        }
                    }
                )
            })
        })
    })
</script>
</html>
