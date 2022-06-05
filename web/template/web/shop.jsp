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
</head>
<body>
<div class="noo-spinner">
    <div class="spinner">
        <div class="cube1"></div>
        <div class="cube2"></div>
    </div>
</div>
<%@include file="phoneHeader.jsp" %>
<div class="site">

    <!-- 引入公共头部登陆条 -->
    <%@include file="loginBar.jsp" %>

    <!-- 引入公共的头部导航条 -->
    <%@include file="header.jsp" %>

    <header class="header header-mobile">
        <div class="container">
            <div class="row">
                <div class="col-xs-2">
                    <div class="header-left">
                        <div id="open-left"><i class="ion-navicon"></i></div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="header-center">
                        <a href="#" id="logo-2">
                            <img class="logo-imagFe" src="images/logo.png" alt="Organik Logo"/>
                        </a>
                    </div>
                </div>搜索商品
                <div class="col-xs-2">
                    <div class="header-right">
                        <div class="mini-cart-wrap">
                            <a href="../webCart/toCartPage">
                                <div class="mini-cart">
                                    <div class="mini-cart-icon" data-count="2">
                                        <i class="ion-bag"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="main">
        <div class="section section-bg-10 pt-11 pb-17">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="page-title text-center">Shop</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="section border-bottom pt-2 pb-2">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="breadcrumbs">
                            <li><a href="home">首页</a></li>
                            <li>商品列表</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="section pt-7 pb-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-md-push-3">
                        <div class="shop-filter">
                            <div class="col-md-6">
                                <p class="result-count"> 共${pagination.total}个商品，每页展示${pagination.count}个商品</p>
                            </div>
                        </div>

                        <div class="product-grid">
                            <c:forEach items="${products}" var="item">
                                <div class="col-md-4 col-sm-6 product-item text-center mb-3">
                                    <div class="product-thumb" style="overflow: hidden">
                                        <a href="product?pid=${item.id}"
                                           style="min-width: 252px; min-height: 252px;">
                                            <c:if test="${item.stock == 0}">
                                                <span class="outofstock"><span style="margin-top: 38px">已售尽</span>补货中……</span>
                                            </c:if>
                                            <img src="pictures/product/${item.firstProductImage.id}.jpg" alt="暂无图片"/>
                                        </a>
                                        <c:if test="${item.stock > 0}">
                                            <div class="product-action">
											<span class="add-to-cart">
												<a href="javascript:;" data-toggle="tooltip" data-placement="top"
                                                   data-goodsId="${item.id}" data-goodsCount="1"
                                                   title="加入购物车" class="addCart"></a>
											</span>
                                                <span class="quickview">
												<a href="product?pid=${item.id}"
                                                   data-toggle="tooltip" data-placement="top" title="查看详细"></a>
											</span>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="product-info">
                                        <a href="product?pid=${item.id}">
                                            <h2 class="title">${item.name}</h2>
                                            <span class="price<c:if test="${item.originalPrice != null}"> delPrice</c:if>">¥${item.originalPrice}</span>
                                            <c:if test="${item.nowPrice != null}"><span
                                                    class="price">¥${item.nowPrice}</span></c:if>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

<%--                        <div class="pagination">--%>
<%--                            <a class="prev page-numbers" data-pages="${pagination}" data-current="${pagination}"--%>
<%--                               id="prev" href="javascript:">上一页</a>--%>
<%--                            <c:forEach begin="1" end="${pages}" var="item">--%>
<%--                                <a class="page-numbers pageBtn <c:if test="${pageInfo.pageNum == item}">current</c:if>"--%>
<%--                                   href="#" data-current="${pageInfo.pageNum}" data-num="${item}">${item}</a>--%>
<%--                            </c:forEach>--%>
<%--                            <a class="next page-numbers" data-pages="${pages}" data-current="${pageInfo.pageNum}"--%>
<%--                               id="next" href="javascript:;">下一页</a>--%>
<%--                        </div>--%>
                    </div>

                    <div class="col-md-3 col-md-pull-9">
                        <%@include file="side.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>
</div>

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
<script>
    layui.use(['layer'], function () {
        var layer = layui.layer;

        // 响应加入购物车按钮
        $(".addCart").click(function () {
            let page = "checkLogin";
            let num = $(this).attr("data-goodsCount");
            let pid = $(this).attr("data-goodsId");
            $.get(page, function (result) {
                if (result == "success") {
                    let cartLink = "addCart?pid=" + pid + "&num=" + num;
                    $.post(cartLink, function (result) {
                        if (result == "success") {
                            layer.msg("添加成功");
                            $("#cartTips").attr("data-count",$(this).attr("cartListCount"))
                            return true;
                        }
                        if (result == "OutOfStock") {
                            alert("库存不足");
                            return false;
                        }
                        alert("添加购物车失败，可能是后台出错了");
                        return false;
                    });

                } else {
                    $("#loginModal").modal('show');
                }
            });
            return false;
        });

        // 响应上一页按钮
        $("#prev").click(function () {
            let current = parseInt($(this).attr("data-current"));
            let pages = parseInt($(this).attr("data-pages"));
            if (current == 1) {
                layer.msg("已经是第一页啦!!");
                return;
            }
            let hrefPath = window.location.href;
            if (hrefPath.indexOf("page=") > 0) {
                hrefPath = hrefPath.replace("page=" + current, "page=" + parseInt(current - 1));
                window.location.href = hrefPath;
            } else {
                if (hrefPath.indexOf("?") > 0) {
                    hrefPath += "&page=" + parseInt(current - 1);
                    window.location.href = hrefPath;
                } else {
                    hrefPath += "?page=" + parseInt(current - 1);
                    window.location.href = hrefPath;
                }
            }
        })

        // 响应下一页按钮
        $("#next").click(function () {
            let current = parseInt($(this).attr("data-current"));
            let pages = parseInt($(this).attr("data-pages"));
            if (current == pages) {
                layer.msg("已经是最后一页啦!!");
                return;
            }
            let hrefPath = window.location.href;
            if (hrefPath.indexOf("page=") > 0) {
                hrefPath = hrefPath.replace("page=" + current, "page=" + parseInt(current + 1));
                window.location.href = hrefPath;
            } else {
                if (hrefPath.indexOf("?") > 0) {
                    hrefPath += "&page=" + parseInt(current + 1);
                    window.location.href = hrefPath;
                } else {
                    hrefPath += "?page=" + parseInt(current + 1);
                    window.location.href = hrefPath;
                }
            }
        })

        // 响应页码按钮
        $(".pageBtn").click(function () {
            let current = parseInt($(this).attr("data-current"));
            let num = parseInt($(this).attr("data-num"));
            if (current == num) {
                return;
            }
            let hrefPath = window.location.href;
            if (hrefPath.indexOf("page=") > 0) {
                hrefPath = hrefPath.replace("page=" + current, "page=" + num);
                window.location.href = hrefPath;
            } else {
                if (hrefPath.indexOf("?") > 0) {
                    hrefPath += "&page=" + num;
                    window.location.href = hrefPath;
                } else {
                    hrefPath += "?page=" + num;
                    window.location.href = hrefPath;
                }
            }
        })
    })
</script>
</body>
</html>