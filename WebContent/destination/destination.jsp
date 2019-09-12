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
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<style type="text/css">
.destination_main {
	height: 225px;
	margin-bottom: 35px;
}
#des_info{
text-align:center;
font-size:20px;
}
h2 {
	text-align: center;
	line-height: 1.5;
	font-weight: 300;
	font-size: 50px;
	margin-bottom: 35px;
	margin-top: 209px;
}
.seoul{
background-image: url(etc/destination_image/seoul.jpg);
}
.incheon{
background-image: url(etc/destination_image/incheon.jpg);
}
.daejeon{
background-image: url(etc/destination_image/daejeon.jpeg);
}
.daegu{
background-image: url(etc/destination_image/daegu.jpg);
}
.gwangju{
background-image: url(etc/destination_image/gwangju.jpg);
}
.busan{
background-image: url(etc/destination_image/busan.jpg);
}
.ulsan{
background-image: url(etc/destination_image/ulsan.jpg);
}
.sejong{
background-image: url(etc/destination_image/sejong.jpg);
}
.gyeonggi{
background-image: url(etc/destination_image/gyeonggi.jpeg);
}
.gangwon{
background-image: url(etc/destination_image/gangwon.jpeg);
}
.chungcheong{
background-image: url(etc/destination_image/chungcheong.jpg);
}
input.gyeongsang{
background-image: url(etc/destination_image/gyeongsang.jpg);
}
.jeolla{
background-image: url(etc/destination_image/jeolla.jpg);
}
.jeju{
background-image: url(etc/destination_image/jeju.jpg);
}
.destination_city {
	text-align : center;
}

#input_place{
	width: 300px;
	height: 170px;
	border: 0;
	outline: 0;
	color: rgba(100%, 100%, 100%, 0);
	font-size: 20pt;
	background-size: 100%;
	margin: 5px;
 	transition: all 0.2s ease-in-out;
	
}
#input_place:hover {
	cursor: pointer;
	color: rgba(100%, 100%, 100%, 1);
	opacity: 0.7;
 	-webkit-transform: scale(1.05); 
 	transform: scale(1.025); 
	letter-spacing: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- 월별 안에 축제 1개씩 보기 -->
		<div class="destination_main">
			<h2>Republic of Korea Destination</h2>
			<p id="des_info">Enjoy the Destination of Republic of Korea<br>
			It gives you various and different experiences of Korea such
				as performance, food, culture and experience.</p>
		</div>
	
			<div class="destination_city">	
				<input id = "input_place" type="button" class="seoul" value="SEOUL"
				onclick="location.href='destination.do?command=city_select&val=seoul'">
				<input id = "input_place" type="button" class="incheon" value="INCHEON"
				onclick="location.href='destination.do?command=city_select&val=incheon'">
				<input id = "input_place" type="button" class="daejeon" value="DAEJEON"
				onclick="location.href='destination.do?command=city_select&val=daejeon'">
				<input id = "input_place" type="button" class="daegu" value="DAEGU"
				onclick="location.href='destination.do?command=city_select&val=daegu'">
				<input id = "input_place" type="button" class="gwangju" value="GWANGJU"
				onclick="location.href='destination.do?command=city_select&val=gwangju'">
				<input id = "input_place" type="button" class="busan" value="BUSAN"
				onclick="location.href='destination.do?command=city_select&val=busan'">
				<input id = "input_place" type="button" class="ulsan" value="ULSAN"
				onclick="location.href='destination.do?command=city_select&val=ulsan'">
				<input id = "input_place" type="button" class="sejong" value="SEJONG"
				onclick="location.href='destination.do?command=city_select&val=sejong'">
				<input id = "input_place" type="button" class="gyeonggi" value="GYEONGGI"
				onclick="location.href='destination.do?command=city_select&val=gyeonggi-do'">
				<input id = "input_place" type="button" class="gangwon" value="GANGWON"
				onclick="location.href='destination.do?command=city_select&val=gangwon-do'">
				<input id = "input_place" type="button" class="chungcheong" value="CHUNGCHEONG"
				onclick="location.href='destination.do?command=city_select&val=chungcheong-do'">
				<input id = "input_place" type="button" class="gyeongsang" value="GYEONGSANG"
				onclick="location.href='destination.do?command=city_select&val=gyeongsang-do'">
				<input id = "input_place" type="button" class="jeolla" value="JEOLLA"
				onclick="location.href='destination.do?command=city_select&val=jeolla-do'">
				<input id = "input_place" type="button" class="jeju" value="JEJU"
				onclick="location.href='destination.do?command=city_select&val=jeju-do'">
			</div>

		<!-- ============================== F O O T E R ======================================== -->   
	<jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>