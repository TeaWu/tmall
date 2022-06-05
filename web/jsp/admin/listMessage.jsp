<%--
  Created by IntelliJ IDEA.
  User: littlestar
  Date: 2022/5/31
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="工单管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="5"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container">
    <ol class="breadcrumb">
        <li class="active">留言管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">留言用户</th>
            <th scope="col">留言内容</th>
            <th scope="col">留言时间</th>
            <th scope="col">回复者</th>
            <th scope="col">回复</th>
            <td scope="col">回复时间</td>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <jsp:useBean id="messages" scope="request" type="java.util.List"/>
        <c:forEach items="${messages}" var="m" varStatus="vs">
            <tr>
                <th scope="row">${m.id}</th>
                <td>${m.user.name}</td>
                <td>${m.content}</td>
                <td><fmt:formatDate value="${m.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${m.replyUser.name}</td>
                <td>${m.replyContent}</td>
                <td><fmt:formatDate value="${m.replyCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <c:if test="${m.replyCreateDate != null}">
                    <td><a href="message_deleteMessage?mid=${m.id}">删除</a></td>
                </c:if>
                <c:if test="${m.replyCreateDate == null}">
                    <td>
                        <button type="button" class="btn btn-primary btn-xs detail-btn">
                            回复
                        </button>
                    </td>
                </c:if>
            </tr>
            <tr style="display: none">
                <td colspan="10">
                    <div class="panel panel-default" style="width: 600px;margin:0 auto">
                        <div class="panel-heading">回复面板</div>
                        <div class="panel-body">
                            <form action="message_replyMessage">
                                <div class="form-group">
                                    <label for="reply" class="col-sm-2 control-label"></label>
                                    <input type="text" class="form-control" id="reply" name="reply" placeholder="回复内容">
                                    <input name="mid" value="${m.id}" type="hidden">
                                </div>
                                <div class="form-group">
                                    <div style="text-align: center">
                                        <button type="submit" class="btn-reply">回复</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--<script>--%>
<%--    $(".btn-reply").click(function () {--%>
<%--        let mid = $("input[name='mid']").val();--%>
<%--        let reply = $("input[name='reply']").val();--%>
<%--        $.ajax({--%>
<%--            url: 'message_replyMessage',--%>
<%--            type: "POST",--%>
<%--            data: {--%>
<%--                mid: mid,--%>
<%--                reply: reply,--%>
<%--            },--%>
<%--            function(result) {--%>
<%--                if (result == "success") {--%>
<%--                    //刷新页面--%>
<%--                    window.location.reload();--%>
<%--                    alert("回复成功");--%>
<%--                    return true;--%>
<%--                } else {--%>
<%--                    alert("回复失败");--%>
<%--                    return false;--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<%@include file="common/adminPage.jsp" %>
<%@include file="common/adminFooter.jsp" %>

