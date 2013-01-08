<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/plugin/easyui/themes/default/easyui.css">  
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/plugin/easyui/themes/icon.css">  
<script type="text/javascript" src="<%=basePath%>resources/plugin/jquery.js"></script>  
<script type="text/javascript" src="<%=basePath%>resources/plugin/easyui/jquery.easyui.min.js"></script>  