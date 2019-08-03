<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>书籍信息浏览</title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
</head>
<body>
    <div class="main">
        <div class="sidbar" id="sidbar">
            <div class="sub_nav">
                <h2><p class="systemIcon">书籍分类</p></h2>
                <div class="switch_subNav">
                    <ul id="show_iframe" class="switch_nav">

						<li class="nav_notcurrent nav_current">
							<a class="subNavigation" id="A001010"
                               data-name="common_iframe" onclick="Common.switchNavigation(this);"
							   data-url="${pageContext.request.contextPath}/book/bookBrowsing.do?categoryId=0">
								全部
							</a>
						</li>

						<c:forEach items="${categories}" var="category" varStatus="status">
						<li class="nav_notcurrent">
							<a class="subNavigation" id="A00101${status.count}"
							   data-name="common_iframe" onclick="Common.switchNavigation(this);"
							   data-url="${pageContext.request.contextPath}/book/bookBrowsing.do?categoryId=${category.categoryId}">
									${category.categoryName}</a>
						</li>
						</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!--====这里是弹出层的内容====-->
		<div id="common_iframe" class="maincontent">
			<div class="searchDiv">
				<input type="text" id="inputBookInfo" name="id" size="25" maxlength="80" placeholder="请输入书本信息进行查找" >
				<button class="searchButton" type="submit">
					<img class="searchimg" src="${pageContext.request.contextPath}/assets/Images/search.png">
				</button>
			</div>
			<div class="btnDiv">
				<input class="btn" type="button" onclick="Common.showPage(this);" value="发布书籍信息" data-url="${pageContext.request.contextPath}/book/bookUpload.do" />
			</div>
				<iframe class="common_iframe" id="A001010_iframe" frameborder="0" border="0" src="${pageContext.request.contextPath}/book/bookBrowsing.do"></iframe>
		</div>
    </div>
    <div class="specific_page tal dn" id="popupLayer" style="z-index: 1;">
        <!--这里删除了style属性-->
        <iframe id="childform" border="0" class="iframe_layer" name="layer_iframe" style="z-index: 10520;" frameborder="0"></iframe>
    </div>
</body>
</html>

