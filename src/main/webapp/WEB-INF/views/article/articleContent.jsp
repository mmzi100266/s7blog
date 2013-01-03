<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<link href="<%=basePath%>resources/plugin/prettify/prettify.css" rel="stylesheet">
<script charset="utf-8" src="<%=basePath%>resources/plugin/prettify/prettify.js"></script>
<script>
    $(window).load(function () {
        prettyPrint();
    })
</script>
<div class="span9" id="blog_content">
    <h2>${blog.title}</h2>

    <p>${blog.body}</p>
</div>