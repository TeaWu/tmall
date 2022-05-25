<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/5
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="用户管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="2"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container">
    <ol class="breadcrumb">
        <li>用户管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">用户名</th>
            <th scope="col">用户组</th>
            <th scope="col">查看资料</th>
            <th scope="col">用户状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>

        <jsp:useBean id="users" class="servlet.UserServlet" scope="session"/>
        <c:forEach items="${users}" var="u" varStatus="vs">
            <tr>
                <th scope="row">${u.id}</th>
                <td>${u.name}</td>
                <td>${u.group}</td>
                <td>
                    <button class="btn btn-primary btn-xs detail-btn">查看详情</button>
                </td>
                <c:if test="${u.state == 1}">
                    <td>正常</td>
                </c:if>
                <c:if test="${u.state == 0}">
                    <td style="color: #d9534f">已冻结</td>
                </c:if>
                <td>
                    <c:if test="${u.state == 1}">
                        <a href="user_freeze?uid=${u.id}">
                            <button class="btn btn-primary btn-xs detail-btn">冻结</button>
                        </a>
                    </c:if>
                    <c:if test="${u.state == 0}">
                        <a href="user_unfreeze?uid=${u.id}">
                            <button class="btn btn-primary btn-xs detail-btn" style="background-color: #d9534f">解冻
                            </button>
                        </a>
                    </c:if>
                </td>
                    <%--                //littlestar TODO : 用户组修改 --%>
            </tr>
            <tr style="display: none">
                <td colspan="10">
                    <div class="panel panel-default" style="width: 600px;margin:0 auto">
                        <div class="panel-heading">用户资料</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <tr>
                                    <td>用户名：</td>
                                    <td>${u.name}</td>
                                </tr>
                                <tr>
                                    <td>用户组：</td>
                                    <td>${u.group}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>

<%@include file="common/adminFooter.jsp" %>

