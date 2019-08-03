<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/loginRegister.css">
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>注册</title>
</head>
<body>
	<%--<div class="header">--%>
        <div class="header_nav">

        </div>
    <%--</div>--%>
	<form action="${pageContext.request.contextPath}/user/register.do" method="post">
            <!--注册内容-->
            <div class="RegisterBody">
                <!--用户姓名标签及输入框-->
                <label class="needInput">用户名称：</label>
                <input type="text" class="rinputInfo" name="userName" size="25" maxlength="80" placeholder="请输入用户姓名" required/>
                <br/>
                <!--登录密码标签及输入框-->
                <label class="needInput">登录密码：</label>
                <input type="password" class="rinputInfo" name="password" size="25" maxlength="80" placeholder="请输入密码" required/>
                <br/>
                <!--确认密码标签及输入框-->
                <label class="needInput">确认密码：</label>
                <input type="password" class="rinputInfo" name="alignPassword" size="25" maxlength="80" placeholder="请再次输入密码" required/>
                <br/>
                <!--电子邮箱标签及输入框-->
                <label class="needInput">电子邮箱：</label>
                <input type="text" class="rinputInfo" name="email" size="25" maxlength="80" placeholder="请输入电子邮箱"/>
                <br/>
                <!--手机号码标签及输入框-->
                <label class="needInput">手机号码：</label>
                <input type="text" class="rinputInfo" name="tel" size="25" maxlength="80" placeholder="请输入手机号码"/>
                <br/>
                <!--注册按钮-->
                <div class="submitBody">
                    <button class="submitButton" type="submit">注册</button>
                </div>
            </div>
        </form>
</body>
</html>