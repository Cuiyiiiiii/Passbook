<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
    <title>修改书籍信息</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/book/updateBook.do?bookId=${book.bookId}"
      enctype="multipart/form-data">
    <div class="specificPageEdit" style="*position: static;width: 70%;">
        <div>
            <div class="specificPage_header fix">
                <h4 class="specificPage_title l">
                    <span id="MainContent_lbTitle">修改书籍信息</span>
                </h4>
                <span class="closePage r" onclick="Common.closePage();">关闭</span>
            </div>
            <div id="MainContent_divTitleTab" class="activeEdite_tab_list"
                 style="margin-bottom: 3px;">
                <p>
                    <span class="tab_list_current" data-tab="tab_1" onclick="Common.switchTab(this);">修改书籍信息</span>
                </p>
            </div>

            <div class="hide_tab fix" data-tab="tab_1" id="tab_1">
                <div id="MainContent_UpdatePanel1">
                    <table class="bookinfotable" border="0" cellpadding="0" cellspacing="6">
                        <tr>
                            <th rowspan="4" class="imgTh">
                                <img class="img-wrapper-info" src="/bookPhotos/${book.photo}"/>
                                <br/>
                                上传图片：<input type="file" name="bookPhoto" class="file-btn">
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="title">书号</h4>
                                <p>
                                    <input class="userinfo-item-input" name="bookId" type="text" value="${book.bookId}"
                                           id="bookId"
                                           style="width: 200px;" readonly="readonly"/>
                                </p>
                            </td>
                            <td rowspan="3">
                                <h4 class="title">描述</h4>
                                <p>
										<textarea class="userinfo-item-input" rows="2" name="description" cols="20"
                                                  style="width: 200px;height: 150px;resize:none;">
                                            ${book.description}
                                        </textarea>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="title">书名</h4>
                                <p>
                                    <input name="bookName" type="text" value="${book.bookName}" id="bookName"
                                           style="width: 200px;" class="userinfo-item-input"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="title">分类</h4>
                                <p>
                                    <select name="categoryName" id="bookType" class="userinfo-item-input">
                                        <c:forEach items="${categories}" var="category" varStatus="status">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="AlterBookInfobtnDiv">
                <input class="btn" type="submit" value="修改"/>
            </div>
        </div>
    </div>
</form>
</body>
</html>