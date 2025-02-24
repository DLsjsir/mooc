<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String jsUrl = request.getContextPath() + "/style/js/";
    String cssUrl = request.getContextPath() + "/style/css/";
    String imgUrl = request.getContextPath() + "/style/img/";
%>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>mooc后台管理系统</title>
</head>
<%-- <%@include file="leftmeun.jsp" %> --%>

<body>

<div class="container" style="max-height: 99%; max-width:99%;margin-left: 0px;
    float:left; text-align:center;                margin-right: 0px;">
    <p style="font-size: 50px;">Mooc举报审核</p>
    <div class="container" style="max-height: 99%; max-width:99%;margin-top: 50px;
			margin-right: 0px;padding-left: 0px;padding-right: 0px;">
        <table class="table table-striped" width="950">
            <tr>
                <td class="col-md-2 text-center">举报信息ID</td>
                <td class="col-md-2 text-center">被举报人用户ID</td>
                <td class="col-md-2 text-center">举报内容</td>
                <td class="col-md-2 text-center">状态</td>
                <td class="col-md-2 text-center">操作</td>
            </tr>
            <c:if test="${reports.size()==0 }">
                <tr>
                    <td colspan="5" style="font-size: 35px;text-align:center;">暂无举报</td>
                </tr>
            </c:if>
            <c:forEach items="${reports}" var="report">
                    <tr>
                        <td class="col-md-2 text-center ">
                                ${report.id}
                        </td>
                        <td class="col-md-2 text-center" style="">
                                ${report.userid}
                        </td>
                        <td class="col-md-2 text-center">${report.comment}</td>
                        <td class="col-md-2 text-center">
                            <c:choose>
                                <c:when test="${report.status eq '0' }">
                                    未审核
                                </c:when>
                                <c:when test="${report.status eq '1' }">
                                    审核通过
                                </c:when>
                                <c:when test="${report.status eq '2' }">
                                    审核不通过
                                </c:when>
                            </c:choose>
                        </td>
                        <c:if test="${report.status==0}">
                            <td class="col-md-2 text-center ">
                                <a class="btn btn-danger delete" style="background-color: green;"
                                   href="examine?id=${report.id }&type=1&page=${page}">审核通过</a>
                                <a class="btn btn-danger delete" style="background-color: red;"
                                   href="examine?id=${report.id }&type=0&page=${page}">审核不通过</a>
                            </td>
                        </c:if>
                        <else>
                            <td class="col-md-2 text-center ">
                        </else>

                    </tr>
            </c:forEach>
        </table>
        <center>
            <c:if test="${page!=0 }">
                <button onclick="prevpage()">上一页</button>
            </c:if>
            <button onclick="reflash()">刷新</button>
            <c:if test="${page!=maxpage }">
                <button onclick="nextpage()">下一页</button>
            </c:if></center>

    </div>
</div>

</body>
<script type="text/javascript">
    function reflash() {
        window.location.reload(true);
    }

    function prevpage() {
        var page = ${page}-1;
        window.location.href = "allreport?page=" + page;
    }

    function nextpage() {
        var page = ${page}+1;
        window.location.href = "allreport?page=" + page;
    }

</script>
</html>