<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>书籍信息</title>
<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
</head>
<body>
	<div id="bookinfoForm" class="bookinfoForm">
		<div class="specificPageEdit" style="width: 80%;">
			<div>
				<div class="specificPage_header fix">
					<h4 class="specificPage_title l">
						<span id="MainContent_lbTitle">书籍信息</span>
					</h4>
					<span  class="closePage r" onclick="Common.closePage();">关闭</span>
				</div>
				<div id="MainComi'gntent_divTitleTab" class="activeEdite_tab_list"
					style="margin-bottom: 3px;">
					<p>
						<span class="tab_list_current" data-tab="tab_1" onclick="Common.switchTab(this);">书籍信息</span>
					</p>
				</div>

				<div class="hide_tab fix" data-tab="tab_1" id="tab_1">
					<div id="MainContent_UpdatePanel1">
						<table class="bookinfotable" border="0" cellpadding="0" cellspacing="6">
							<tr>
								<th rowspan="4" class="imgTh">
									<img class="img-wrapper-info" src="/bookPhotos/${book.photo}" />
								</th>
							</tr>
							<tr>
								<td>
								<h4 class="title">书名</h4>
									<p>
										<input name="" type="text" value="${book.bookName}" id="bookName"
										style="width: 200px;" readonly="readonly" class="userinfo-item-input"/>
									</p>
								</td>
								<td rowspan="4">
									<h4 class="title">历史留言</h4>
									<textarea class="userinfo-item-input" rows="2" name="" cols="20" readonly="readonly" style="width: 200px;height: 200px;resize:none;">
										<c:forEach items="${comments}" var="comment" varStatus="status">
												${comment.userName}:${comment.content}
										</c:forEach>
									</textarea>
								</td>
							</tr>
							<tr>
								<td>
								<h4 class="title">分类</h4>
									<p>
										<input name="" type="text" value="${book.categoryId}" id=""
										style="width: 200px;" readonly="readonly" class="userinfo-item-input"/>
									</p>
								</td>
							</tr>
							<tr>
								<td>
								<h4 class="title">描述</h4>
									<p>
										<textarea class="userinfo-item-input" rows="2" name="" cols="20" readonly="readonly" style="width: 200px;height: 80px;resize:none;">${book.description}</textarea>
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="massageDiv">
					<form method="post" action="${pageContext.request.contextPath}/user/comment.do?bookId=${book.bookId}">
						<h4 class="title">留言</h4>
						<textarea class="userinfo-item-input" rows="2" name="message" cols="20" style="width: 400px;height: 60px;resize:none;"></textarea>
						<input class="massageDiv-btn" type="submit" value="发送"/>
					</form>

				</div>
				 <div class="BookInfobtnDiv">
                    <%--<input class="btn" type="button" value="联系传书人" onclick=""/>--%>
					 <form method="post" action="${pageContext.request.contextPath}/book/want.do?bookId=${book.bookId}">
						 <input type="submit" class="btn" value="想要？告诉书主" style="width: 150px"/>
					 </form>
                </div>
			</div>
		</div>
	</div>
</body>
</html>