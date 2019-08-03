<%@ page import="com.xx.edu.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
    <title>基本信息</title>
</head>
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<body>

<header class="userinfo-tit">
    <span>基本信息</span>
</header>
<form method="post" action="${pageContext.request.contextPath}/user/updateUserInfo.do" enctype="multipart/form-data">
    <div>
        <img class="img-user" src="/profilePhotos/<%out.print(currentUser.getProfilePhoto());%>"/>
    </div>
    <div class="userinfo">
        <div class="userinfo-item">
            <label class="userinfo-item-label">上传头像：</label>
            <div class="userinfo-item-input-block">
                <input class="file-btn" type="file" name="profilePhoto" value="上传照片">
            </div>
        </div>
        <div class="userinfo-item">
            <label class="userinfo-item-label">用户账户</label>
            <div class="userinfo-item-input-block">
                <input type="text" name="userId" autocomplete="off"
                       class="userinfo-item-input" value="<%out.print(currentUser.getUserId());%>" disabled="disabled">
            </div>
        </div>
        <div class="userinfo-item">
            <label class="userinfo-item-label">用户名称</label>
            <div class="userinfo-item-input-block">
                <input type="text" name="userName"
                       class="userinfo-item-input" value="<%out.print(currentUser.getUserName());%>">
            </div>
        </div>
        <div class="userinfo-item">
            <label class="userinfo-item-label">电子邮箱</label>
            <div class="userinfo-item-input-block">
                <input type="text" name="email"
                       class="userinfo-item-input" value="<%out.print(currentUser.getEmail());%>">
            </div>
        </div>
        <div class="userinfo-item">
            <label class="userinfo-item-label">电话号码</label>
            <div class="userinfo-item-input-block">
                <input type="text" name="tel"
                       class="userinfo-item-input" value="<%out.print(currentUser.getTel());%>">
            </div>
        </div>
        <div class="userinfo-btn">
            <input type="submit" class="btn" value="修改">
        </div>
    </div>
</form>
</body>
</html>