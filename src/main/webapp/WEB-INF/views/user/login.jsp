<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="row">
	<div id="login_form">
		<div class="container">
			<form class="form-signin" method="post"
				action="<%=basePath%>my/loginSubmit">
				<h2 class="form-signin-heading">Please sign in</h2>
				<input name="loginName" type="text" class="input-block-level"
					placeholder="请输入账号"> <input name="password" type="password"
					class="input-block-level" placeholder="请输入密码"> <label
					class="checkbox"> <input type="checkbox"
					value="remember-me"> 记住我
				</label>
				<button class="btn btn-large btn-primary" type="submit">登陆</button>
			</form>
		</div>
	</div>
</div>
<style type="text/css">
.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>