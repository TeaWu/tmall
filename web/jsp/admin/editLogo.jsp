<%--
  Created by IntelliJ IDEA.
  User: Dream-Rain
  Date: 2022/5/25
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="编辑logo"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="6"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container" >
    <ol class="breadcrumb">
        <li><a href="config_list">网站设置</a></li>
        <li>${c.name}</li>
    </ol>
</div>
<div class="container">
    <h4 class="page-header">更换logo</h4>
    <div class="row" >
        <div class="panel panel-default" style="width: 600px;margin:0 auto">
            <div class="panel-heading">更换logo</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="add-form" action="logo_addUpdate" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="file" class="col-sm-2 control-label">图片文件</label>
                        <div class="col-sm-10">
                            <input id="file" name="file" type="file" class="file">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${c.id}">
                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function checkEmpty(id,name){
        var value = $('#'+id).val();
        if(value.length===0){
            alert(name+"不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    $(function(){
        $("#add-form").submit(function () {
            if(!checkEmpty("name","logo名称")){
                return false;
            }
        });
        $(".delete-button").click(function () {
            return !!confirm("确实删除？");
        });
    });
</script>
<%@include file="common/adminFooter.jsp" %>
