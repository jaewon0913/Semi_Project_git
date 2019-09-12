<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String rootpath = request.getSession().getServletContext().getRealPath("/");
%>
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css">

<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js"></script>

<style type="text/css">
.festival_main {
	height: 225px;
	margin-bottom: 35px;
}

h2 {
	text-align: center;
	line-height: 1.5;
	font-weight: 300;
	font-size: 50px;
	margin-bottom: 35px;
	margin-top: 209px;
}

.month_festival {
	text-align : center;
}

#input_ft {
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

#input_ft:hover {
	cursor: pointer;
	color: rgba(100%, 100%, 100%, 1);
	opacity: 0.7;
	font-size: 20pt;
 	-webkit-transform: scale(1.05); 
 	transform: scale(1.025); 
	letter-spacing: 5px;
	background-color: black;
}

.jan {
	background-image: url(../etc/festival_month_image/img_January.png);
}

.feb {
	background-image: url(../etc/festival_month_image/img_February.png);
}

.mar {
	background-image: url(../etc/festival_month_image/img_March.jpeg);
}

.apr {
	background-image: url(../etc/festival_month_image/img_April.png);
}

.may {
	background-image: url(../etc/festival_month_image/img_May.png);
}

.jun {
	background-image: url(../etc/festival_month_image/img_June.png);
}

.jul {
	background-image: url(../etc/festival_month_image/img_July.jpg);
}

.agu {
	background-image: url(../etc/festival_month_image/img_August.jpg);
}

.sep {
	background-image: url(../etc/festival_month_image/img_September.png);
}

.oct {
	background-image: url(../etc/festival_month_image/img_October.png);
	   
}

.nov {
	background-image: url(../etc/festival_month_image/img_November.png);
}

.dec {
	background-image: url(../etc/festival_month_image/img_December.png);
}
#fes_info{
text-align:center;
font-size:20px;
}

</style>
</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	<!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
	<!-- 월별축제 -->
	<div id="body">
		<div class="festival_main">
			<h2>Republic of Korea Festival</h2>
			<p id="fes_info">Enjoy the festival of Republic of Korea<br>
			It gives you various and different experiences of Korea such
				as performance, food, culture and experience.</p>
		</div>
		
		<div class="month_festival">
			<input id = "input_ft" type="button" class="jan" value="JANUARY"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=01'">
			<input id = "input_ft" type="button" class="feb" value="FEBRUARY"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=02'">
			<input id = "input_ft" type="button" class="mar" value="MARCH"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=03'">

			<input id = "input_ft" type="button" class="apr" value="APRIL"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=04'">
			<input id = "input_ft" type="button" class="may" value="MAY"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=05'">
			<input id = "input_ft" type="button" class="jun" value="JUNE"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=06'">

			<input id = "input_ft" type="button" class="jul" value="JULY"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=07'">
			<input id = "input_ft" type="button" class="agu" value="AUGUST"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=08'">
			<input id = "input_ft" type="button" class="sep" value="SEPTEMBER"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=09'">

			<input id = "input_ft" type="button" class="oct" value="OCTOBER"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=10'">
			<input id = "input_ft" type="button" class="nov" value="NOVEMBER"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=11'">
			<input id = "input_ft" type="button" class="dec" value="DECEMBER"
				onclick="location.href='${pageContext.request.contextPath }/festival.do?command=month&val=12'">
		</div>
		
	</div>
	<!-- ============================== F O O T E R ======================================== -->
   	<jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>