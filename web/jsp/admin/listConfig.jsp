<%--
  Created by IntelliJ IDEA.
  User: Dream-Rain
  Date: 2022/5/26
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="网站设置"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="7"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container">
    <ol class="breadcrumb">
        <li>网站设置</li>
    </ol>
</div>

<div class="container">

    <div class="panel panel-default">
        <div class="panel-heading">修改设置</div>
        <div class="panel-body">

            <form class="form-horizontal" method="get" id="add-form" action="config_addUpdate"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <c:forEach items="${configs}" var="c" varStatus="vs" begin="0" end="5">
                        <label for="name${vs.count}" class="col-sm-2 control-label"
                               style="margin-bottom: 10px;">${c.cname}</label>
                        <div class="col-sm-10" style="margin-bottom: 10px;">
                            <input type="hidden" name="id" value="${c.id}">
                            <input type="text" class="form-control" id="name${vs.count}" name="value"
                                   placeholder="请输入${c.cname}" value="${c.value}">
                        </div>
                    </c:forEach>
                    <c:forEach items="${configs}" var="c" varStatus="vs">
                        <c:if test="${vs.last==true}">
                            <label for="name${vs.count}" class="col-sm-2 control-label"
                                   style="margin-bottom: 10px;">${c.cname}</label>
                            <div class="col-sm-10" style="margin-bottom: 10px;">
                                <input type="hidden" name="id" value="${c.id}">
                                <img src="../images/logo.png" height="100px" alt="logo图片获取失败">
                                <a href="config_link"><span class="btn btn-success btn-sm">更改</span></a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="form-group">
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success btn-sm">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="common/adminFooter.jsp" %>