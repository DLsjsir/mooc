<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style/css/login.css">
    <script src="style/js/login.js"></script>
    <link rel="stylesheet" href="style/css/amazeui.min.css">
    <link rel="stylesheet" href="style/css/course.css">
    <link rel="stylesheet" href="style/css/admin.css">
    <script src="style/js/loginandregist.js"></script>
    <script src="style/js/jquery-2.1.4.min.js"></script>
    <script src="style/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="style/css/bootstrap.min.css">
    <title>mooc</title>
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
        #pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        #pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #pagination button:hover {
            background-color: #0056b3;
        }

        #pagination span {
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f9fa;
            color: #333;
        }

    </style>
</head>
<body>
<!--下面是顶部导航栏的代码-->
<%@include file="head.jsp" %>

<div class="container-fluid" style="text-align: center;">
    <div id="displayArea" style="font-size:17px;letter-spacing: 2px;line-height: 1.4;margin-top: 100px;margin-left: 200px;margin-right: 200px;margin-bottom: 20px"></div>

    <div id="pagination">
        <button onclick="previousPage()">上一页</button>
        <span id="pageNumber">1</span>
        <button onclick="nextPage()">下一页</button>
    </div>

    <script>
        let currentPage = 1;
        let pages = [];
        // 读取文件内容
        function readFile() {
            fetch('../style/txt/test.txt')
                .then(response => response.text())
                .then(text => paginateText(text))
                .catch(error => console.error('Error reading file:', error));
        }

        // 分页逻辑
        function paginateText(text) {
            const charsPerPage = 1000; // 每页显示的字数
            pages = [];
            for (let i = 0; i < text.length; i += charsPerPage) {
                pages.push(text.slice(i, i + charsPerPage));
            }
            displayPage(pages, 1); // 显示第一页内容
        }

        // 显示页面内容
        function displayPage(pages, pageNumber) {
            const displayArea = document.getElementById('displayArea');
            displayArea.textContent = pages[pageNumber - 1];
        }

        // 上一页
        function previousPage() {
            if (currentPage > 1) {
                currentPage--;
                displayPage(pages, currentPage);
                document.getElementById('pageNumber').textContent = currentPage;
            }
        }

        // 下一页
        function nextPage() {
            if (currentPage < pages.length) {
                currentPage++;
                displayPage(pages, currentPage);
                document.getElementById('pageNumber').textContent = currentPage;
            }
        }

        // 页面加载时读取文件
        window.onload = readFile;
    </script>
</div>

<!-- 评论区 -->
<div
        style="position: relative; border: 2px solid; border-radius: 5px; margin: auto; top: 20px; width: 1000px; padding: 10px;">
    <!-- 输入区 -->
    <div
            style="background-color:; position: relative; width: 975px; padding: 10px; margin-bottom: 30px; border-bottom-style: dotted;">
        <form action="subreview" method="post">
            <input type="hidden" name="courseid" value="${course.id}">
            <div
                    style="position: relative; height: 150px; width: 200px; padding: 20px;">
                感觉课程怎么样？<br> <input type="radio" name="lable" value="1">一般<br>
                <input type="radio" name="lable" value="2">还行<br> <input
                    type="radio" name="lable" value="3">不错<br> <input
                    type="radio" name="lable" value="4">非常好<br>
            </div>
            <div
                    style="position: absolute; left: 250px; top: 10px; height: 150px; width: 500px;">
					<textarea name="context" style="width: 100%; height: 100%;"
                              placeholder="输入你想说的话"></textarea>
            </div>
            <div
                    style="position: absolute; left: 750px; top: 10px; height: 150px; width: 100px;">
                <input type="submit" value="提交"
                       style="position: relative; left: 20px; top: 100px; height: 30px; width: 90px; border: 2px solid; border-radius: 5px;">
            </div>
        </form>
    </div>
    <!-- 展示评论区 -->
    <c:forEach var="review" items="${reviews}" varStatus="status">
        <div
                style="position: relative; width: 955px; border: 2px solid; border-radius: 5px; margin: 10px;">
            <div
                    style="background-color:; position: relative; width: 200px; height: 100px; padding-left: 20px; padding-top: 10px;">
                <c:if test="${review.vip==0 }">
                    <img alt="" src="style/image/vi.JPG">
                </c:if>
                <c:if test="${review.vip==1 }">
                    <img alt="" src="style/image/vip.JPG">
                </c:if>
                用户：${review.username}<br>
                <c:if test="${review.lable != null }">
                    <c:if test="${review.sex ==null}">
                        他觉得课程:
                    </c:if>
                    <c:if test="${review.sex eq 'Male'}">
                        他觉得课程:
                    </c:if>
                    <c:if test="${review.sex eq 'Female'}">
                        她觉得课程:
                    </c:if>

                    <c:if test="${review.lable == 1 }">
                        一般
                    </c:if>
                    <c:if test="${review.lable == 2 }">
                        还行
                    </c:if>
                    <c:if test="${review.lable == 3 }">
                        不错
                    </c:if>
                    <c:if test="${review.lable == 4 }">
                        非常好
                    </c:if>
                </c:if>
            </div>
            <div
                    style="position: absolute; left: 210px; top: 10px; height: 80px; width: 640px;">

                    ${review.context}</div>
            <div
                    style="position: absolute; left: 850px; top: 5px; height: 80px; width: 100px;">
                发表于：<br><fmt:formatDate value="${review.time}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        </div>
    </c:forEach>
</div>
<footer style="text-align: center">
    <hr>
    <p class="am-padding-left">© 2018 <a href="#">山西农业大学北京海淀基地</a>.作者:杨祺晖 </p>
</footer>
</body>
</html>
