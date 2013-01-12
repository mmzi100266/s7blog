<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<link href="<%=basePath%>resources/plugin/prettify/prettify.css" rel="stylesheet">
<script charset="utf-8" src="<%=basePath%>resources/plugin/prettify/prettify.js"></script>
<script charset="utf-8" src="<%=basePath%>resources/plugin/jquery.form.js"></script>
<script>
    $(window).load(function () {
        prettyPrint();
    });
</script>

<div class="span9" id="blog_content">
    <div id="blog_body">
        <h2>${blog.title}</h2>

        <p>${blog.body}</p>
    </div>

	<div>
	    <fieldset>
    		<legend>看看评论</legend>
    	</fieldset>
	</div>
    <div id="comments">

    </div>

    <form action="<%=basePath%>comment/post" method="post" class="form-inline" id="comment_form">
        <fieldset>
            <legend id="output">我要留言</legend>

            <div class="controls controls-row" id="comment_div">
                <textarea class="span8" name="body"></textarea>
                <input type="hidden" name="belongTo" value="${blog.blogId}"/>
                <button class="btn btn-large btn-primary span4" type="submit">发表留言</button>
            </div>
        </fieldset>
    </form>
</div>

<style>
    #blog_body {
        min-height: 500px;
    }
    .one_comment{
    }
</style>
<script type="text/javascript">
    // prepare the form when the DOM is ready
    $(document).ready(function () {
    	
    	clearComments();
        loadComments();
    	
        var options = {
            target: '#output2',   // target element(s) to be updated with server response
            beforeSubmit: showRequest,  // pre-submit callback
            success: showResponse,  // post-submit callback
            type: "post",       // 'get' or 'post', override for form's 'method' attribute
            dataType: "json",        // 'xml', 'script', or 'json' (expected server response type)
            clearForm: true        // clear all form fields after successful submit
        };

        $('#comment_form').submit(function () {
            $(this).ajaxSubmit(options);
            return false;
        });
    });

    function showRequest(formData, jqForm, options) {
        var queryString = $.param(formData);

        $("#success_tip").remove();
        return true;
    }

    function showResponse(responseText, statusText, xhr, $form) {

        $("#output").after("<div id='success_tip' class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button>" + responseText.message + "</div>")
        clearComments();
        loadComments();
    }

    function loadComments() {
        var url = "<%=basePath%>comment/listByBlog";
        var blogId = ${blog.blogId};
        $.getJSON(url, {"blogId": blogId }, function (data) {
            $.each(data, function (index, value) {
                var body = value.body;
                var timstamp = value.createTime;
                var unixTimestamp = new Date(timstamp);
                var commonTime = unixTimestamp.toLocaleString();
                var divStart = '<div class="one_comment alert alert-info">';
                var bodyP = '<p>' + body + '</p>';
                var dtP = '<p>发表日期：&nbsp;' + commonTime + '</p>';
                var divEnd = '</div>';
                var all = divStart + bodyP + dtP + divEnd;
                $("#comments").append(all);
            });
        });
    }

    function clearComments() {
        $("#comments").children().remove();
    }
</script>