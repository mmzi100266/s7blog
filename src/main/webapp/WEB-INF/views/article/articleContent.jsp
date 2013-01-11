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

    <form action="<%=basePath%>article/newcomment" method="post" class="form-inline">
        <fieldset>
            <legend>留言</legend>
            <div class="controls controls-row" id="comment_div">
                <textarea class="span8"></textarea>
                <button class="btn btn-large btn-primary span4" type="button">Large button</button>
            </div>
        </fieldset>
    </form>
</div>

<style>
    #blog_body {
        min-height: 500px;
    }

</style>