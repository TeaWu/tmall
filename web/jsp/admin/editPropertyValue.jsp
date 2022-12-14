<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/5
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="分类管理 - 产品管理 - 修改属性值"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="1"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container">
    <ol class="breadcrumb">
        <li><a href="category_list">所有分类</a></li>
        <li><a href="product_list?cid=${product.category.id}">${product.category.name}</a></li>
        <li>${product.name}</li>
        <li>属性值管理</li>
    </ol>
</div>

<div class="container">

    <div class="panel panel-default">
        <div class="panel-heading">编辑属性</div>
        <div class="panel-body">

            <form class="form-horizontal" method="get" id="add-form" action="product_updatePropertyValue">
                <div class="form-group">
                    <jsp:useBean id="propsMap" scope="request" type="java.util.Map"/>
                    <c:forEach items="${propsMap}" var="map" varStatus="vs">
                        <label for="name${vs.count}" class="col-sm-1 control-label"
                               style="margin-bottom: 10px;">${map.key.name}</label>
                        <div class="col-sm-5" style="margin-bottom: 10px;">
                            <input type="text" class="form-control" id="name${vs.count}" name="ptid_${map.key.id}"
                                   placeholder="请输入${map.key.name}" value="${map.value.value}">
                        </div>
                    </c:forEach>
                </div>

                <div class="form-group">
                    <input name="pid" value="${product.id}" type="hidden">
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success btn-sm">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

