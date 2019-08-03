<%@ page import="com.xx.edu.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>传书</title>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
</head>
<%
    //get current user
    User currentUser = (User) session.getAttribute("currentUser");
%>
<body>
<form id="form1">
    <!--====这里放主导航====-->
    <div class="header">
        <div class="header_nav">
            <nav>
                <ul id="showMainNav" class="fix">
                    <li class="navContent nav_current">
                        <a class="showNav" id="book" data-name="main_iframe"
                           onclick="Common.switchNavigation(this);"
                           data-url="${pageContext.request.contextPath}/book/bookManage.do">主页</a>
                    </li>
                    <li class="navContent">
                        <a class="showNav" id="user" data-name="main_iframe"
                           onclick="Common.switchNavigation(this);"
                           data-url="${pageContext.request.contextPath}/user/userMain.do">个人中心</a>
                    </li>
                    <li><h2 class="version"></h2></li>
                    <li>
                        <div id="welcome" style="margin-top: 20px;margin-left: 5px">
                            <a id="btnLogin" href="${pageContext.request.contextPath}/user/loginPage.do">点击登录</a>
                            <a id="btnLogout" href="${pageContext.request.contextPath}/user/logout.do">退出登录</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!--====下面是主要内容区域====-->
    <div id="main_iframe" class="index_mainIfram_position  mainIfram_position">
        <iframe class="main_iframe" id="home_iframe" frameborder="0"
                border="0" src="${pageContext.request.contextPath}/book/bookManage.do"></iframe>
    </div>
    <!--====下面是页脚====-->
    <div class="footer">
        <footer>
            <p></p>
        </footer>
    </div>
</form>
<div class="specific_page tal dn" id="popupLayer">
    <!--这里删除了style属性-->
    <iframe id="childform" border="0" class="iframe_layer" name="layer_iframe" style="z-index: 10520;"
            frameborder="0"></iframe>
</div>
</body>
</html>

<script language="JavaScript">
    <%
    if (currentUser == null) {
    %>
    $("#welcome").prepend("welcome,游客");
    $("#searchOrder").hide();
    $("#orderHistory").append("请登录...");
    $("#personal").append("请登录...");
    $("#btnLogout").hide();
    <%
    } else {
    %>
    $("#welcome").prepend("welcome," + "<%=currentUser.getUserName()%>");
    $("#btnLogin").hide();
    $("#btnLogout").show();
    <%
    }
    %>
</script>