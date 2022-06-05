<%--
  Created by IntelliJ IDEA.
  User: littlestar
  Date: 2022/5/30
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="评论管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="6"/>
<%@include file="common/adminNavigator.jsp" %>

<div class="container">
    <ol class="breadcrumb">
        <li>公告管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">发布用户</th>
            <th scope="col">标题</th>
            <th scope="col">内容</th>
            <th scope="col">发布时间</th>
            <%--            <th scope="col">展示</th>--%>
            <th scope="col" width="120px">操作</th>
        </tr>
        </thead>
        <tbody>
        <jsp:useBean id="notices" scope="request" type="java.util.List"/>
        <c:forEach items="${notices}" var="n" varStatus="vs">
        <tr>
            <th scope="row">${n.id}</th>
            <td>${n.user.name}</td>
            <td>${n.title}</td>
            <td>${n.content}</td>
            <td><fmt:formatDate value="${n.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <%--            <td>--%>
                <%--                <c:if test="${n.status == 1}">--%>
                <%--                    已发布--%>
                <%--                </c:if>--%>
                <%--                <c:if test="${n.status == 0}">--%>
                <%--                    已撤除--%>
                <%--                </c:if>--%>
                <%--            </td>--%>
            <td><a href="notice_delete?nid=${n.id}" class="delete-button"><span
                    class="glyphicon glyphicon-trash"></span></a></td>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>

<div class="container">
    <div class="row">
        <div class="panel panel-default" style="width: 600px;margin:auto">
            <div class="panel-heading">新发布公告</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="add-form" action="notice_addUpdate"
                      enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">公告标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" name="title"
                                   placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">公告标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="content" name="content"
                                   placeholder="请输入内容">
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">发布公告</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="common/adminFooter.jsp" %>

