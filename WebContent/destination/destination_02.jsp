<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "java.util.*" %>
<%@ page import = "com.semi.destination.dto.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<script type="text/javascript">
	function popUp(w, h, primarykey) {
		x = (screen.availWidth - w) / 2;
		y = (screen.availHeight - h) / 2;
		var url = "destination.do?command=detail&primarykey=" + primarykey;
		var name = "Destination Information";
		window.open(url, name, 'width=' + w + ', height=' + h + ', left=' + x
				+ ', top=' + y);
	}
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
	margin-top: 6px;
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
#paging{
	position : relative;
	top : 300px;
	float: left;
}
</style>
</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<div class="city_main">
		<h2>The capital of Republic of Korea, ${list.get(0).getCity_name() }</h2>
		<p id="city_info">
			The largest city in Republic of Korea<br> It serves as the
			center of Korean politics, economy, society, and culture.
		</p>
	</div>
	<div id="city_body">
		<c:forEach items="${list }" var="dto">
			<a href="javascript:window.popUp(600,350,${dto.place_no });">
				<div id="city_list">
					<div class="des_img_div">
						<img class="des_img" src="${pageContext.request.contextPath }/etc/destination_city_image/inwang.jpg" />
					</div>
					<div id="des_name">
						<div id="pl_name">${dto.place_name }</div>
						<p id="phon_p">${dto.phon }</p>
						<p id="add_p">${dto.address }</p>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<div align = "center" id = "page">
		<jsp:include page="/paging/destinationpaging.jsp">
		<jsp:param value="${paging.page}" name="page" />
		<jsp:param value="${paging.beginPage}" name="beginPage" />
		<jsp:param value="${paging.endPage}" name="endPage" />
		<jsp:param value="${paging.prev}" name="prev" />
		<jsp:param value="${paging.next}" name="next" />
		<jsp:param value="${list.get(0).getCity_name() }" name="city" />
	</jsp:include>
	</div>

	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>