<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pagecss.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/pagejs.js"></script>


<script type="text/javascript">
</script>

<style type="text/css">
.city_main {
	height: 225px;
	margin-bottom: 35px;
}

#city_info {
	text-align: center;
	font-size: 20px;
	color: gray;
}

h2 {
	text-align: center;
	line-height: 1.5;
	font-weight: 300;
	font-size: 50px;
	margin-bottom: 35px;
	margin-top: 209px;
}

#city_body {
	width: 880px;
	margin: auto;
}

#city_list {
	float: left;
	width: 280px;
	height: 250px;
	margin: 5px;
	border: 1px solid lightgrey;
}

.des_img_div {
	width: 278px;
	height: 180px;
	overflow: hidden;
}

.des_img {
	width: 278px;
	height: 180px;
	margin-bottom: -2px;
	transform: scale(1);
	transition: all 1s;
}

.des_img:hover {
	transform: scale(1.2);
	transition: all 1s;
}

#des_name {
	height: 69px;
	position: relative;
	top: -3px;
}

#pl_name {
	margin: 0px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 14px;
	font-weight: bold;
	margin-top: 13px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

#phon_p {
	margin: 0px;
	font-size: 12px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 3px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

#add_p {
	font-size: 12px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 2px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

#paging {
	position: relative;
	top: 300px;
	float: left;
}
#help_info{
display:none;
position:absolute;
top:-210px;
}
</style>
</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- 월별 안에 축제 1개씩 보기 -->
	<div id="body">
	</div>
	<div class="city_main">
		<h2>The capital of Republic of Korea</h2>
		<p id="city_info">
			The largest city in Republic of Korea<br> It serves as the
			center of Korean politics, economy, society, and culture.
		</p>
	</div>
	<div id="city_body">
		<!-- location.href='destination.do?command=des_select&val=${dto.place_no }' -->
		<c:forEach items="${list }" var="dto">
			<a href="${dto.homepage }">
				<div id="city_list">
					<div class="des_img_div">
						<img class="des_img" src="${dto.festival_img }" />
					</div>
					<div id="des_name">
						<div id="pl_name">${dto.festival_name }</div>
						<p id="phon_p">${dto.festival_start }~${dto.festival_end }</p>
						<p id="add_p">${dto.agency }</p>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<!-- ============================== F O O T E R ======================================== -->

	<jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>