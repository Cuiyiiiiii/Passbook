<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
    <title>查看发布书籍</title>
</head>
<body>
<header class="userinfo-tit">
    <span>查看发布书籍</span>
</header>
<div id="books">
    <c:forEach items="${books}" var="book" varStatus="status">
        <div class="item">
            <a class="book-info">
                <img class="img-wrapper" src="/bookPhotos/${book.photo}"/>
                <h4 class="bookName">${book.bookName}</h4>
            </a>
            <br>
            <p>
                <input type="button" class="btn" value="修改" onclick="Common.showPage(this);"
                       data-url="${pageContext.request.contextPath}/book/bookAlter.do?bookId=${book.bookId}"/>
            </p>
        </div>
    </c:forEach>
</div>
<div class="specific_page tal dn" id="popupLayer" style="z-index: 1;">
    <iframe id="childform" border="0" class="iframe_layer" name="layer_iframe" style="z-index: 10520;"
            frameborder="0"></iframe>
</div>


</body>
</html>