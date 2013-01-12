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
    })
</script>

<div class="span9" id="blog_content">
    <div id="blog_body">
        <h2>${blog.title}</h2>

        <p>${blog.body}</p>
    </div>

    <div id="comments">
    </div>

    <form action="<%=basePath%>comment/post" method="post" class="form-inline" id="comment_form">
        <fieldset>
            <legend id="output">留言</legend>

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
</style>
<script type="text/javascript">
    // prepare the form when the DOM is ready
    $(document).ready(function () {
        var options = {
            target: '#output2',   // target element(s) to be updated with server response
            beforeSubmit: showRequest,  // pre-submit callback
            success: showResponse,  // post-submit callback

            // other available options:
            //url:       url         // override for form's 'action' attribute
            type: "post",       // 'get' or 'post', override for form's 'method' attribute
            dataType: "json",        // 'xml', 'script', or 'json' (expected server response type)
            clearForm: true        // clear all form fields after successful submit
            //resetForm: true        // reset the form after successful submit

            // $.ajax options can be used here too, for example:
            //timeout:   3000
        };

        // bind to the form's submit event
        $('#comment_form').submit(function () {
            // inside event callbacks 'this' is the DOM element so we first
            // wrap it in a jQuery object and then invoke ajaxSubmit
            $(this).ajaxSubmit(options);

            // !!! Important !!!
            // always return false to prevent standard browser submit and page navigation
            return false;
        });
    });

    // pre-submit callback
    function showRequest(formData, jqForm, options) {
        // formData is an array; here we use $.param to convert it to a string to display it
        // but the form plugin does this for you automatically when it submits the data
        var queryString = $.param(formData);

        // jqForm is a jQuery object encapsulating the form element.  To access the
        // DOM element for the form do this:
        // var formElement = jqForm[0];

        //alert('About to submit: \n\n' + queryString);
        $("#success_tip").remove();
        // here we could return false to prevent the form from being submitted;
        // returning anything other than false will allow the form submit to continue
        return true;
    }

    // post-submit callback
    function showResponse(responseText, statusText, xhr, $form) {
        // for normal html responses, the first argument to the success callback
        // is the XMLHttpRequest object's responseText property

        // if the ajaxSubmit method was passed an Options Object with the dataType
        // property set to 'xml' then the first argument to the success callback
        // is the XMLHttpRequest object's responseXML property

        // if the ajaxSubmit method was passed an Options Object with the dataType
        // property set to 'json' then the first argument to the success callback
        // is the json data object returned by the server

        alert('status: ' + statusText + '\n\nresponseText: \n' + responseText.message +
                '\n\nThe output div should have already been updated with the responseText.');
        $("#output").after("<div id='success_tip' class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button>" + responseText.message + "</div>")
        clearComments();
        loadComments();
    }

    function loadComments() {
        var url = "<%=basePath%>comment/listByBlog";
        $.getJSON(url, {"blogId":${blog.blogId}}, function (data) {
            $.each(data, function (index, value) {
                var body = value.body;
                var timstamp = value.createTime;
//                var date = new Date();
//                var now = date.setTime(createTime).toLocaleString();

                var divStart = '<div class="one_comment alert alert-info">';
                var bodyP = '<p>' + body + '</p>';
                var dtP = '<p>发表日期：&nbsp;' + timstamp + '</p>';
                var divEnd = '</div>';
                var all = divStart + bodyP + dtP + divEnd;
                console.info(all);
                $(all).insertAfter("#comments");
            });
        });
    }

    function clearComments() {
        $("#comments").remove();
    }
</script>