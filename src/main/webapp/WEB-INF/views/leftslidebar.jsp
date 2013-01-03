<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="left_slidebar" class="span3">
    <div class="row" id="info1">
        <div style="float:left;">
            <img src="<%=basePath%>resources/images/pics/my2.jpg" style="padding-left: 30px;"></div>
        <div>
            <p class="myinfo">孙小超</p>
            <p class="myinfo">快乐每一天&学无止境</p>
        </div>
    </div>
    <div class="row" id="info2">1</div>
</div>