<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="favicon.ico" rel="icon" type="image/x-icon" />
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script src="style/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="style/css/base.css">
<link rel="stylesheet" type="text/css" href="style/css/home.css">
<script type="text/javascript" src="style/js/banner.js"></script>
<script type="text/javascript" src="style/js/ad.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style type="text/css">
body {
	background-color: #f5f5f5;
	padding-left: 0px;
}

#contents {
	background-color: #FFF;
	padding-left: 20px;
}
</style>
</head>
<%@include file="head.jsp"%>
<div class="container" style="margin-top: 5%">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">

					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column" >
							<a>0-18岁</a>
							<div class="row clearfix">
								<c:forEach var="course" items="${ageType0}" begin="0" end="2">
									<div class="col-md-4 column" >
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
												href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
															${course.context}</div>
														<div
															class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">0-18岁</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column">
							<a>18-40岁</a>
							<div class="row clearfix">
								<c:forEach var="course" items="${ageType1}" begin="0" end="100">

									<div class="col-md-4 column">
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
												href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
															${course.context}</div>
														<div
															class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">18-40岁</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>

									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column" >
							<a>40-60岁</a>
							<div class="row clearfix">
								<c:forEach var="course" items="${ageType2}" begin="0" end="2">
									<div class="col-md-4 column" >
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
											   href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																 src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																 data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
																${course.context}</div>
														<div
																class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">40-60岁</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
					<div class="row clearfix" style="margin-top: 3%">
						<div class="col-md-12 column" >
							<a>60岁以上</a>
							<div class="row clearfix">
								<c:forEach var="course" items="${ageType3}" begin="0" end="100">
									<div class="col-md-4 column" >
										<!--Regular if23-->
										<div class="uc-coursecard uc-ykt-coursecard f-fl">
											<a target="_blank" class="j-href"
											   href="coursedetail?id=${course.id}">
												<div class="uc-ykt-coursecard-wrap f-cb f-pr">
													<div class="uc-ykt-coursecard-wrap_box">
														<div class="uc-ykt-coursecard-wrap_picbox f-pr">
															<img class="imgPic j-img"
																 src="<c:url value="/style/image/courses/${course.id}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>"
																 data-src="" alt="课程图片">
															<div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_tit">
															<h3 class="">${course.name}</h3>
														</div>
														<div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
																${course.context}</div>
														<div
																class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
															<div class="m-scorecnt f-fl f-cb">
																<div class="uc-starrating">

																	<span class="uc-starrating_score">${course.label }</span>
																</div>
															</div>
															<div class="m-hot f-fl">
																<!--Regular if24-->
																(${course.hour }人学过)

															</div>
														</div>
														<div class="uc-ykt-coursecard-wrap_price f-pa">
															<!--Regular if25-->
															<span class="u-free">60岁以上</span>

														</div>
														<!--Regular if26-->
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<footer style="text-align: center">
<hr>
<p class="am-padding-left">
	© 2025 <a href="#">郑州西亚斯学院</a>. 作者:杨祺晖
</p>
</br>
</br>
</br>
</footer>

</body>
</html>
