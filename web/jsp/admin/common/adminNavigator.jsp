<%@ page contentType="text/html;charset=UTF-8" %>

<nav class="navbar navbar-default clearfix">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">超市后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="${light==1?'active':''}"><a href="category_list">分类管理</a></li>
                <li class="${light==2?'active':''}"><a href="user_list">用户管理</a></li>
                <li class="${light==3?'active':''}"><a href="order_list">订单管理</a></li>
                <li class="${light==4?'active':''}"><a href="comment_list">评论管理</a></li>
                <li class="${light==5?'active':''}"><a href="message_list">工单管理</a></li>
                <li class="${light==6?'active':''}"><a href="notice_list">公告管理</a></li>
                <li class="${light==7?'active':''}"><a href="config_list">网站设置</a></li>
<%--                广告管理--%>

                <li class=""><a href="<c:url value="/"/>" target="_blank">访问前台</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
