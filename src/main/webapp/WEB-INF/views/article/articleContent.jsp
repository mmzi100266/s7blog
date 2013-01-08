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
    <div id="blog_body">
        <h2>${blog.title}</h2>

        <p>${blog.body}</p>
    </div>

    <div id="comments">

    </div>

    <form action="<%=basePath%>article/newcomment" method="post">
        <div class="controls controls-row">
            <textarea id="comment_title" class="span4" type="text" placeholder="内容" rows="2"></textarea>
            <textarea class="span8" type="text" placeholder="留言内容" rows="5"></textarea>
            <button id="submit_comment_btn" class="btn btn-large btn-block btn-primary" type="submit">
                留言
            </button>
        </div>
    </form>
</div>

<style>
    #blog_body {
        min-height: 500px;
    }

    #submit_comment_btn {
        width: 275px;
        position: relative;
        top: -55px;
    }
</style>