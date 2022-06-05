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
</head>
<%@include file="loginBar.jsp"%>
<!-- 引入公共的头部导航条 -->
<%@include file="header.jsp"%>
<body>
<div class="noo-spinner">
    <div class="spinner">
        <div class="cube1"></div>
        <div class="cube2"></div>
    </div>
</div>
<%@include file="phoneHeader.jsp" %>
<script>
    var deleteOid = -1;
    $(function () {
        $(".order-type a").click(function () {
            var orderStatus = $(this).attr("order-status");
            if ('all' === orderStatus) {
                $("table[order-status]").show();
            } else {
                $("table[order-status]").hide();
                $("table[order-status=" + orderStatus + "]").show();
            }
            $(".order-type div").removeClass("selected");
            $(this).parent("div").addClass("selected");

        });
        $(".delete-button").click(function () {
            deleteOid = $(this).attr("oid");
            $("#confirmModal").modal('show');
        });
        $("#confirmDelete").click(function () {
            $("#confirmModal").modal("hide");
            var page = "deleteOrder";
            $.get(page, {"oid": deleteOid}, function (result) {
                if (result === "success") {
                    $("table[oid=" + deleteOid + "]").remove();
                } else {
                    alert("服务器错误，删除失败");
                }
            });
        });
        $("#cancelDelete").click(function () {
            $("#confirmModal").modal("hide");
        });
    });
</script>

<section class="order-type">
    <div class="selected"><a href="#nowhere" order-status="all">所有订单</a></div>
    <div><a href="#nowhere" order-status="waitPay">待付款</a></div>
    <div><a href="#nowhere" order-status="waitDelivery">待发货</a></div>
    <div><a href="#nowhere" order-status="waitConfirm">待确认</a></div>
    <div><a href="#nowhere" order-status="waitReview">待评价</a></div>
</section>

<main class="order-list">
    <table class="head-table">
        <thead>
        <th>宝贝</th>
        <th width="100px">单价</th>
        <th width="100px">数量</th>
        <th width="150px">实付款</th>
        <th width="120px">交易操作</th>
        </thead>
    </table>
    <c:forEach items="${orders}" var="o" varStatus="vs">
        <table class="line-table" order-status="${o.status}" oid="${o.id}">
            <tr class="item-head">
                <td colspan="5" class="time-and-order">
                    <b>${o.createDate}</b>
                    <span>订单号: ${o.orderCode}</span>
                </td>
<%--                <td>--%>
<%--                    <span class="seller"><img src="img/tmall-small.png">天猫商城</span>--%>
<%--                </td>--%>
<%--                <td colspan="2">--%>
<%--                    <span class="wangwang"></span>--%>
<%--                </td>--%>
                <td class="delete">
                    <c:if test="${o.status=='finish'|| o.status == 'waitPay'}">
                        <a href="#nowhere" class="delete-button" oid="${o.id}">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </c:if>
                </td>
            </tr>
            <c:forEach items="${o.orderItems}" var="oi" varStatus="vs2">
                <tr class="item-body">
                    <td width="100px">
                        <img src="pictures/product/${oi.product.firstProductImage.id}.jpg" class="cart-item-jpg">
                    </td>
                    <td class="item-name">
                        <a class="cart-item-title" href="product?pid=${oi.product.id}">${oi.product.name}</a>
<%--                        <div class="cart-item-title-bottom">--%>
<%--                            <img title="保障卡" src="img/baozhang.png">--%>
<%--                        </div>--%>
                    </td>
                    <td width="100px" class="num-center">
                        <span class="cart-item-old-price">￥${oi.product.originalPrice}</span>
                        <span class="cart-item-now-price">￥${oi.product.nowPrice}</span>
                    </td>
                    <c:if test="${vs2.count==1}">
                        <td width="100px" class="num-center border-left" rowspan="${o.totalNumber}">
                            <span class="order-item-num">${o.totalNumber}</span>
                        </td>
                        <td class="price-td" width="150px" rowspan="${o.totalNumber}">
                            <span class="order-item-sum">￥${o.sum}</span>
                            <span class="freight">(含运费：￥0.00)</span>
                        </td>
                    </c:if>
                    <c:if test="${vs2.count==1 && o.status!='waitReview' }">
                        <td width="120px" rowspan="${o.totalNumber}">

                            <c:if test="${o.status=='waitConfirm' }">
                                <a href="confirmPay?oid=${o.id}" class="order-button blue">确认收货</a>
                            </c:if>
                            <c:if test="${o.status=='waitPay' }">
                                <a href="pay?oid=${o.id}" class="order-button blue">付款</a>
                                <a href="cancel?oid=${o.id}" class="order-button blue">取消订单</a>
                            </c:if>

                            <c:if test="${o.status=='waitDelivery' }">
                                <a href="#nowhere" class="order-button blue">待发货</a>
                                <a href="delivery?oid=${o.id}" class="order-button blue">自己发货</a>
                                <a href="cancel?oid=${o.id}" class="order-button blue">取消订单</a>
                            </c:if>
                            <c:if test="${o.status=='finish' }">
                                <a href="#nowhere" class="order-button blue">完成订单</a>
                            </c:if>
                            <c:if test="${o.status=='cancel' }">
                                <a href="#nowhere" class="order-button blue">已取消</a>
                            </c:if>
                        </td>
                    </c:if>


                    <c:if test="${o.status=='waitReview' }">
                        <td width="120px">
                            <a href="comment?oiid=${oi.id}" class="order-button blue">评价</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:forEach>
    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-title">删除宝贝</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>

                <div class="confirm-content">确认要删除该宝贝吗？</div>
                <div class="button-group">
                    <button class="yes" id="confirmDelete">确定</button>
                    <button class="no" id="cancelDelete">取消</button>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
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
</html>