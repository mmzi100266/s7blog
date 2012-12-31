<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="span9">

    <c:forEach items="${blogs}" var="i">
        <div class="article">
            <a href="<%=basePath%>"><h4 class="title">${i.title} </h4></a>

            <p class="shortBody"> ${i.shortBody}
            </p>

            <p>${i.loginName}</p>
        </div>
    </c:forEach>

</div>