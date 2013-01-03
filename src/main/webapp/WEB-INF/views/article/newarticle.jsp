<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script charset="utf-8" src="<%=basePath%>resources/plugin/editor/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>resources/plugin/editor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=basePath%>resources/plugin/editor/plugins/code/prettify.js"></script>
<script>
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('#editor_id', {
                    uploadJson: '../jsp/upload_json.jsp',
                    allowFileManager: false,
                    cssPath: '<%=basePath%>resources/plugin/editor/plugins/code/prettify.css'}
        );
    });
    prettyPrint();
</script>

<div class="span9">
    <form action="<%=basePath%>my/post" method="post">
        <select class="span3" style="margin-right: 15px">
            <option value="-1" selected="selected">请选择一个分类</option>
        </select>
        <input class="span9" type="text" name="title" placeholder="请输入标题" />

        <textarea id="editor_id" name="body" style="height:400px;" class="input-block-level">
            请输入内容
        </textarea>

        <div class="btn_group" style="padding: 6px;text-align: center;">
            <button class="btn btn-large btn-primary" type="submit">Post</button>
            <button class="btn btn-large" type="button">Reset</button>
        </div>
    </form>
</div>