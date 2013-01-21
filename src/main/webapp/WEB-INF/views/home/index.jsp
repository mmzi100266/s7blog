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

	<c:forEach items="${page.list}" var="i">
		<div class="article">
			<a href="<%=basePath%>article/${i.blogId}"><h4 class="title">${i.title}
				</h4></a>

			<p class="shortBody">${i.shortBody}</p>

			<p>${i.loginName}</p>
		</div>
	</c:forEach>
	<div class="pagination" style="text-align: center;" >
		<ul>
			<li><a href="<%=basePath%>1">First</a></li>
			<c:choose>
				<c:when test="${page.currentPage != 1 }">
					<li><a href="<%=basePath%>${(page.currentPage)-1}">Prev</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:void(0);">Prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${page.currentPage != 1}">
				<li><a href="<%=basePath%>${(page.currentPage)-1}">${(page.currentPage)-1}</a></li>
			</c:if>
			<li><a href="<%=basePath%>${(page.currentPage)}">${(page.currentPage)}</a></li>
			<li><a href="<%=basePath%>${(page.currentPage)+1}">${(page.currentPage)+1}</a></li>
			<li><a href="<%=basePath%>${(page.currentPage)+2}">${(page.currentPage)+2}</a></li>
			<li><a href="<%=basePath%>${(page.currentPage)+1}">Next</a></li>
			<li><a href="<%=basePath%>${page.totalPages}">Last</a></li>
		</ul>
	</div>

</div>