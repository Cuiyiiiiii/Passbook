<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
    <title>书主确认</title>
</head>

<body>
<header class="userinfo-tit">
    <span>书主确认</span>
</header>
<div style="text-align: center;">
    <div class="notice">
        <c:forEach items="${requests}" var="request" varStatus="status">
            <div class="notice-item">
                <div class="notice-info">
                    <label class="notice-info-label">${request.bookName}</label>
                    <label class="notice-info-label">请求者：${request.requesterId}</label>
                </div>
                <div class="notice-btn">
                    <form method="post" action="${pageContext.request.contextPath}/user/agree.do?requestId=${request.requestId}&bookName=${request.bookName}">
                        <input type="submit" class="btn" value="同意"/>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>