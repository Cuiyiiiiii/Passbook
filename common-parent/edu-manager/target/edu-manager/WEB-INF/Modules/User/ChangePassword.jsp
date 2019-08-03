<%@ page import="org.springframework.web.servlet.handler.UserRoleAuthorizationInterceptor" %>
<%@ page import="com.xx.edu.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
<title>修改密码</title>
</head>

<%
	User currentUser = (User)session.getAttribute("currentUser");
%>
<body>
	<header class="userinfo-tit">
		<span>修改密码</span>
	</header>
	<form method="post" action="${pageContext.request.contextPath}/user/updatePassword.do">
		<div class="userinfo">
			<div class="userinfo-item">
				<label class="userinfo-item-label">用户账号</label>
				<div class="userinfo-item-input-block">
					<input type="text" name="userId"  autocomplete="off"
						   class="userinfo-item-input" value="<%out.print(currentUser.getUserId());%>" disabled="disabled">
				</div>
			</div>
			<div class="userinfo-item">
				<label class="userinfo-item-label">旧密码</label>
				<div class="userinfo-item-input-block">
					<input type="text" name="oldPassword"
						   class="userinfo-item-input" value="">
				</div>
			</div>
			<div class="userinfo-item">
				<label class="userinfo-item-label">新密码</label>
				<div class="userinfo-item-input-block">
					<input type="text" name="newPassword"
						   class="userinfo-item-input" value="">
				</div>
			</div>
			<div class="userinfo-item">
				<label class="userinfo-item-label">确认密码</label>
				<div class="userinfo-item-input-block">
					<input type="text" name="alignNewPassword"
						   class="userinfo-item-input" value="">
				</div>
			</div>
			<div class="userinfo-btn">
				<button type="submit" class="btn">修改</button>
			</div>
		</div>
	</form>
</body>
</html>