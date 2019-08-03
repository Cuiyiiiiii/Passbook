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
    <title>登录</title>
</head>
<body>
        <div class="header_nav">

        </div>
        <!--登录内容-->
        <form action="${pageContext.request.contextPath}/user/login.do" method="post">
            <div class="LoginBody">
                <br />
                <!--账号-->
                <img src="${pageContext.request.contextPath}/assets/Images/user.png"/>
                <input type="text" class="inputInfo" name="userName" size="25" maxlength="80" placeholder="账号" />
                <br />
                <!--密码-->
                <img src="${pageContext.request.contextPath}/assets/Images/pd.png"/>
                <input type="password" class="inputInfo" name="password" size="25" maxlength="80" placeholder="密码" />
                <br />
                <!--是否记住密码多选框-->
                <div class="checkboxBody">
                    <label class="checkValue" for="lab">
                        <input type="checkbox" name="isRemember" class="checkBox" value="lab"/>记住密码</label>
                    <!--登录超链接-->
                    <a class="forget" href="${pageContext.request.contextPath}/user/RegisterPage.do"><label class="forget">没有账号？点击这里</label></a>
                </div>
                <br />
                <!--登录按钮-->
                <div class="submitBody">
                    <button class="submitButton" type="submit">登录</button>
                </div>
            </div>
        </form>
        
</body>
</html>