<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="left_slidebar" class="span3">
    <div class="row" id="post_new">
        <p><a>发表内容</a></p>
    </div>
    <div class="row" id="blog_category">
        <div id="category_titile">
            博客分类
        </div>
        <div id="category_list">
            <div class="one_cate">技术博客</div>
            <div class="one_cate">随便写写</div>
            <div class="one_cate">随便写写</div>
            <div class="one_cate">技术博客</div>
            <div class="one_cate">随便写写</div>
            <div class="one_cate">随便写写</div>
        </div>
    </div>
</div>

<style>

    .one_cate{
        width: 80px;
        background: #d3d3d3;
        float: left;
        margin: 2px;
    }

    #post_new a {
        text-decoration: none;
        color: #000000;
    }

    #post_new:hover {
        background-color: #D4D4D4
    }
</style>