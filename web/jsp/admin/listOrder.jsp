
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="订单管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="3"/>
<%@include file="common/adminNavigator.jsp" %>
<style>
    .button {
        /*background-color: #4CAF50;*/
        border: none;
        color: white;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        border-radius: 4px;
    }

</style>
<script>
    $(function(){

    })
</script>
<div class="container">
        <div>
            <ol class="breadcrumb">
                <li>订单管理</li>
            </ol>
        </div>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">订单金额</th>
            <th scope="col">商品数量</th>
<%--            <th scope="col">买家名称</th>--%>
<%--            <th scope="col">创建时间</th>--%>
<%--            <th scope="col">支付时间</th>--%>
            <th scope="col">收货地址</th>
            <th scope="col">发货时间</th>
            <th scope="col">确认收货时间</th>
            <th scope="col">状态</th>
            <th scope="col">查看详情</th>
            <th scope="col" width="120px">操作</th>
        </tr>
        </thead>
        <tbody>

        <jsp:useBean id="orders" scope="request" type="java.util.List"/>
        <c:forEach items="${orders}" var="o" varStatus="vs">
            <tr>
                <th scope="row">${o.id}</th>
                <td>${o.totalPrice}</td>
                <td>${o.totalNumber}</td>
                <td>${o.address}</td>
<%--                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
<%--                <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
                <td><fmt:formatDate value="${o.deliverDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <c:if test="${o.status == '待发货'}">
                        <button class="button btn-xs" style="background-color: #a94442">${o.status}</button>
                    </c:if>
                    <c:if test="${o.status == '已取消'}">
                        <button class="button btn-xs" style="background-color: #7f8c8d">${o.status}</button>
                    </c:if>
                    <c:if test="${o.status != '已取消' && o.status != '待发货'}">
                        <button class="button btn-xs" style="background-color: #4CAF50">${o.status}</button>
                    </c:if>

                </td>
                <td>
                    <button class="btn btn-primary btn-xs detail-btn">查看详情</button>
                </td>
                <td>
                    <c:if test="${o.status == '待发货'}">
                        <a href="order_delivery?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">发货</button>
                        </a>
                    </c:if>
                    <c:if test="${o.status == '待发货' || o.status == '待付款'}">
                        <a href="order_cancel?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">取消</button>
                        </a>
                    </c:if>
                    <a href="order_delete?oid=${o.id}">
                        <button class="btn btn-primary btn-xs">删除</button>
                    </a>
                </td>
            </tr>
            <tr style="display: none">
                <td colspan="10">
                    <div class="panel panel-default" style="width: 600px;margin:0 auto">
                        <div class="panel-heading">订单详情</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <tr>
                                    <th scope="col">商品名称</th>
                                    <th scope="col">商品图片</th>
                                    <th scope="col">单价</th>
                                    <th scope="col">收货人名称</th>
                                    <th scope="col">创建时间</th>
                                    <th scope="col">支付时间</th>
                                </tr>
                                <c:forEach items="${o.orderItems}" var="item" varStatus="vs">
                                    <tr>
                                        <td>${item.product.name}</td>
                                        <td><img width="40px" height="40px"
                                                 src="../pictures/product/${item.product.firstProductImage.id}.jpg">
                                        </td>
                                        <td>${item.product.nowPrice}元</td>
                                        <td>${o.receiver}</td>
                                        <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                </c:forEach>
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

