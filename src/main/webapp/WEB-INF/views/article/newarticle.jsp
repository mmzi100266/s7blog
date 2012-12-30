<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script charset="utf-8" src="<%=basePath%>resources/plugin/editor/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>resources/plugin/editor/lang/zh_CN.js"></script>
<script>
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('#editor_id');
    });
</script>

<div class="span9">
    <form action="<%=basePath%>my/post" method="post">
        <input class="input-block-level" type="text" name="title">

        <textarea id="editor_id" name="body" style="height:400px;" class="input-block-level">
            &lt;strong&gt;HTML内容&lt;/strong&gt;
        </textarea>

        <div class="btn_group" style="padding: 6px;text-align: center;">
            <button class="btn btn-large btn-primary" type="submit">Post</button>
            <button class="btn btn-large" type="button">Reset</button>
        </div>
    </form>
</div>