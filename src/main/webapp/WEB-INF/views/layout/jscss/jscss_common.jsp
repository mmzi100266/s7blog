<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
      href="<%=basePath%>resources/plugin/bootstrap/css/bootstrap.min.css"
      type="text/css" media="screen"/>
<link href="<%=basePath%>resources/plugin/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>resources/css/site.css" type="text/css"
      media="screen"/>
<script src="<%=basePath%>resources/plugin/jquery.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/plugin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/plugin/jquery.blockUI.js" type="text/javascript"></script>