<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="navbar" id="navbar">
    <div class="navbar-inner">
        <a class="brand" href="<%=basePath%>"><h1>S7 Blog</h1></a>
        <ul class="nav">
            <li class="active"><a href="<%=basePath%>"><h2>首页</h2></a></li>
            <li><a href="#"><h2>分类</h2></a></li>
            <li><a href="#"><h2>关于</h2></a></li>
        </ul>
    </div>
</div>