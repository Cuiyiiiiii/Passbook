<%@ page import="com.xx.edu.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>个人中心</title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
</head>
<%
	User currentUser = (User) session.getAttribute("currentUser");
%>
<body>
	  <form id="form3">
    <div class="main">
        <div class="sidbar" id="sidbar">
            <div class="sub_nav">
            	<h2><p class="systemIcon">个人中心</p></h2>
                <div class="switch_subNav">
                    <ul id="show_iframe" class="switch_nav">
						<li class="nav_notcurrent nav_current">
							<a class="subNavigation" id="U001010"
                               data-name="common_iframe" onclick="Common.switchNavigation(this);"
							   data-url="${pageContext.request.contextPath}/user/userBaseInfo.do">基本信息</a>
						</li>
						<li class="nav_notcurrent">
							<a class="subNavigation" id="U001011"
							   data-name="common_iframe" onclick="Common.switchNavigation(this);"
							   data-url="${pageContext.request.contextPath}/user/userCollection.do">个人收藏</a>
						</li>
						<li class="nav_notcurrent">
							<a class="subNavigation" id="U001100"
							data-name="common_iframe" onclick="Common.switchNavigation(this);" 
							data-url="${pageContext.request.contextPath}/user/changePassword.do">修改密码</a>
						</li>
						<li class="nav_notcurrent">
							<a class="subNavigation" id="U001101"
							data-name="common_iframe" onclick="Common.switchNavigation(this);" 
							data-url="${pageContext.request.contextPath}/book/checkUpload.do">个人发布</a>
						</li>
						<li class="nav_notcurrent">
							<a class="subNavigation" id="U0011011"
							   data-name="common_iframe" onclick="Common.switchNavigation(this);"
							   data-url="${pageContext.request.contextPath}/user/userLockBook.do">私人藏书</a>
						</li>
						<li class="nav_notcurrent">
							<a class="subNavigation" id="U001110"
							data-name="common_iframe" onclick="Common.switchNavigation(this);"
							data-url="${pageContext.request.contextPath}/user/ownerAgreement.do?userId=<%out.print(currentUser.getUserId());%>">
								书主确认</a>
						</li>
                    </ul>
                </div>
            </div>
        </div>
		<div id="common_iframe" class="maincontent">
			<iframe class="common_iframe" id="U001010_iframe" frameborder="0" border="0" src="${pageContext.request.contextPath}/user/userBaseInfo.do"></iframe>
		</div>
    </div>
    <div class="specific_page tal dn" id="popupLayer" style="z-index: 1;">
        <!--删除了style-->
        <iframe id="childform" border="0" class="iframe_layer" name="layer_iframe" style="z-index: 10520;" frameborder="0"></iframe>
    </div>
    
    </form>
</body>
</html>