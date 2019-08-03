<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>发布书籍</title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
</head>

<body>
	<form method="post" action="${pageContext.request.contextPath}/book/upload.do" enctype="multipart/form-data" class="uploadForm">
		<div class="specificPageEdit" style="*position: static;">
			<div>
				<div class="specificPage_header fix">
					<h4 class="specificPage_title l">
						<span id="MainContent_lbTitle">发布书籍</span>
					</h4>
					<span  class="closePage r" onclick="Common.closePage();">关闭</span>
				</div>
				<div id="MainContent_divTitleTab" class="activeEdite_tab_list"
					style="margin-bottom: 3px;">
					<p>
						<span class="tab_list_current" data-tab="tab_1" onclick="Common.switchTab(this);">发布书籍</span>
					</p>
				</div>
				<div class="hide_tab fix" data-tab="tab_1" id="tab_1">
					<div id="MainContent_UpdatePanel1">
						<div align="center">
							<label class="input_text tar">上传照片：</label>
							<input class="file-btn" type="file" name="bookPhoto">
						</div>
						<table class="booktable" border="0" cellpadding="0" cellspacing="6">
							<tr>
								<td class="input_text tar">书名</td>
								<td>
									<p>
										<input class="userinfo-item-input" name="bookName" type="text" value="" id="bookName" style="width: 200px;" />
									</p>
								</td>
							<tr>
								<td class="input_text tar">分类</td>
								<td>
									  <select name="category" id="bookType" class="userinfo-item-input" >
                                        <c:forEach items="${categories}" var="category" varStatus="status">
                                          <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td class="input_text tar">描述</td>
								<td>
									<p>
										<input name="description" type="text" value="" id="description" style="width: 200px;height: 150px;" class="userinfo-item-input"/>
									</p>
								</td>
								
							</tr>
						</table>
					</div>
				</div>
				 <div class="form_btn form_btn_static">
                    <ul>
                        <li><input type="submit" value="发布"/></li>
                        <li><input type="button" value="关闭" onclick="Common.closePage();" /></li>
                    </ul>
                </div>
			</div>
		</div>
	</form>
</body>
</html>
