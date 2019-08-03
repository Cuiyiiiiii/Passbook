<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
<title>书籍浏览</title>
</head>
<body>
<c:forEach items="${books}" var="book" varStatus="status">
	<div class="item">
    <a class="book-info" onclick="Common.showPage(this);" data-url="${pageContext.request.contextPath}/book/bookInfo.do?bookId=${book.bookId}">
        <img class="img-wrapper" src="/bookPhotos/${book.photo}" />
      	<h4 class="bookName">${book.bookName}</h4>
    </a>
    <p>
      <img id="isLikeimg" class="like" src="${pageContext.request.contextPath}/assets/Images/like.png">
      <span class="status">状态：${book.state}</span>
    </p>

  </div>
</c:forEach>
 <div class="specific_page tal dn" id="popupLayer" style="z-index: 1;">
        <!--这里删除了style属性-->
        <iframe id="childform" border="0" class="iframe_layer" name="layer_iframe" style="z-index: 10520;" frameborder="0"></iframe>
    </div>
</body>
</html>

