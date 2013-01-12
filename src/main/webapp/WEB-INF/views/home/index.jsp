<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="span9">

	<c:forEach items="${blogs}" var="i">
		<div class="article">
			<a href="<%=basePath%>article/${i.blogId}"><h4 class="title">${i.title}
				</h4></a>

			<p class="shortBody">${i.shortBody}</p>

			<p>${i.loginName}</p>
		</div>
	</c:forEach>
	<div class="pagination" style="text-align: center;" >
		<ul>
			<li><a href="#">Prev</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</div>

</div>