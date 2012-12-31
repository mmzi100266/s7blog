<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="span9">

    <c:forEach items="${blogs}" var="i">
        <div class="article">
            <h4>${i.title}</h4>

            <p> ${i.body}
            </p>

            <p>${i.loginName}</p>
        </div>
    </c:forEach>

</div>