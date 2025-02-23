<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="style/css/amazeui.min.css">
    <link rel="stylesheet" href="style/css/course.css">
    <link rel="stylesheet" href="style/css/admin.css">
    <script src="style/js/loginandregist.js"></script>
    <script src="style/js/jquery-2.1.4.min.js"></script>
    <script src="style/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="style/css/bootstrap.min.css">
    <title>mooc</title>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>    <![endif]-->
    <script>
        $(document).ready(function () {
            console.log('测试')
            // 查询学习进度
            var courseId = ${course.id};
            var userId = ${loginUser.id};
            var coursetime = ${course.time};
            var time = 0;
            var process = 0;
            $.ajax({
                url: '/courseprocess/getcourseprocess',
                type: 'GET',
                data: {
                    courseid: courseId,
                    userid: userId
                },
                success: function (response) {
                    time = response.learntime; // 假设服务器返回的时间进度字段为timeSpent
                    if (coursetime != 0) {
                        process = (time / 60 / coursetime) * 100; // 计算进度百分比
                    }
                    console.log(response);
                    console.log(courseId);
                    console.log(userId);
                    console.log(time);
                    console.log(coursetime);
                    console.log(process);
                    document.getElementById("progress-bar").innerHTML =  process.toFixed(2) + '%'; // 更新进度显示，并保留两位小数
                    document.getElementById("progress-bar").style.width = process + '%'; // 更新进度条宽度
                },
                error: function () {
                    console.error('获取学习进度失败');
                }
            });
        });
    </script>

    <style>
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }

        .progress-container {
            width: 100%;
            max-width: 100%;
            height: 20px;
            background-color: #e0e0e0;
            border-radius: 5px;
            overflow: hidden;
            margin-top: 10px;
        }

        .progress-bar {
            height: 20px;
            background-color: #4caf50;
            width: 0;
            transition: width 0.5s ease;
            overflow:visible;
        }
    </style>

</head>

<body>
<!--下面是顶部导航栏的代码-->
<%@include file="head.jsp" %>
<div class="mc-search-course-breadcrumb">
    <ul class="g-flow f-cb">
        <li><a href="${pageContext.request.contextPath }"
               target="_blank">首页</a></li>

        <li class="current"><span class="arrow"></span> <a
                href="javascript: void(0);">课程详情</a></li>

    </ul>
</div>
<div class="g-flow f-cb">


    <div class="f-bg courseheadbox" id="j-coursehead">

        <div class="u-courseHead" id="auto-id-1509947716498">

            <div class="ov f-pr j-ch" style="padding-top: 0px; top: 10px;">


                <div class="g-sd1 left j-chimg">
                    <img width="450" height="250"
                         src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=450y250&amp;quality=100"/>">
                </div>

                <div class="g-mn1">

                    <div class="g-mn1c right j-right f-pr">
                        <div class="ctarea f-fl j-cht">
                            <div class="u-coursetitle f-fl" id="auto-id-1509947716616">
                                <h2 class="f-thide">
                                    <span class="u-coursetitle_title" title="">${course.name}</span>
                                </h2>

                                <div class="f-cb margin-top-15">
										<span class="cmt"><c:if test="${course.type==0 }">0-18岁</c:if>
										<c:if test="${course.type==1 }">18-40岁</c:if>
										<c:if test="${course.type==2 }">40-60岁</c:if>
										<c:if test="${course.type==3 }">60岁以上</c:if>
</span> <br>
                                    <span class="cmt">学习人数(${course.hour }) </span> <br>
                                    <c:if test="${course.label}!=null">
                                        <span class="cmt">平均评价：${course.label} </span>
                                        <br/>
                                    </c:if>

                                    <div class="f-fl" style="margin-right: 3px;">
                                        <a href="#" target="_blank" class="j-userNode"
                                           data-id="837467" data-type="10"
                                           id="auto-id-1509947716617">${course.context}</a>
                                    </div>
                                    <br>
                                    <br>
                                    <div class="process" style="font-size: 12px">学习进度:</div>
                                    <div class="progress-container">
                                        <div class="progress-bar" id="progress-bar">  学习进度 %</div>
                                    </div>

                                    <br>

                                </div>

                            </div>
                        </div>
                        <div>

                            <div class="btnarea f-pa j-chbtnarea">

                                <c:if test="${isSelect == false }">
                                    <c:choose>
                                        <c:when test="${course.price eq 0 }">
                                            <a class="learnbtn f-db f-cb j-joinBtn"> <span>立即参加</span></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a style="background: gray; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;">
                                                <span>暂时下架</span></a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${isSelect == true }">
                                    <a class="learnbtn f-db f-cb j-joinBtn"><span>取消课程</span></a>
                                    <c:choose>
                                        <c:when test="${course.price eq 0 }">
                                            <a href="coursevideo?courseid=${course.id}"><span
                                                    style="background: #ee6600; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;">去听课</span></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#"><span
                                                    style="background: gray; color: white; font-size: 20px; line-height: 45px; width: 160px; height: 45px; text-align: center; vertical-align: middle; display: inline-block;">课程暂时下架</span></a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>


</div>
<script>
    $(document)
        .ready(
            function () {
                $(".learnbtn")
                    .click(
                        function () {
                            if (!"${loginUser}") {
                                window.location = "${pageContext.request.contextPath }/login.jsp";
                            } else {
                                if ("${isSelect}" == "true") {
                                    deleteCourse();

                                } else {
                                    insertCourse();
                                    //location.reload() ;
                                }
                            }

                        });
            });

    function insertCourse() {

        $.ajax({
            type: "post",
            url: "insertCourse",
            data: {
                "courseid": "${course.id}",
                "userid": "${loginUser.id}"
            },
            async: false,
            method: 'post',
            dataType: "text",
            success: function (data) {
                alert(data);
                /* alert(password==data); */
                location.reload(true);

            },
            error: function (data) {
                //alert("进入了error方法");
                location.reload(true);
            }
        });
        //location.reload() ;
    }

    function deleteCourse() {

        $.ajax({
            type: "post",
            url: "deleteCourse",
            data: {
                "courseid": "${course.id}",
                "userid": "${loginUser.id}"
            },
            async: true,
            success: function (data) {
                /* alert(password==data); */
                if (data == "true") {

                    location.reload(true);
                } else {
                    $(".learnbtn").focus();
                    return;
                }
                /* alert(data); */
            },
            error: function (data) {
                //alert("进入了error方法");
                location.reload(true);
            }
        });
    }
</script>
<footer style="text-align: center">
    <hr>
    <p class="am-padding-left">
        © 2025 <a href="#">郑州西亚斯学院</a>. 作者:艾思琪
    </p>
</footer>
</body>
</html>
