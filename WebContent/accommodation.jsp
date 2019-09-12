<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

	<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<style type="text/css">
	#aco_img{
		width: 100px;
		height: 100px;
	}
	
	.all{
	
		margin-top: 10em;
	
	}
	.hotel{
	
		display: inline-block;
		padding-left: 30px;
	
	}

</style>
</head>
<body>
	<jsp:include page="pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->

	<div align="center" class="all">

	<div class="hotel first">
	<a href="http://www.hotelscombined.co.kr/">
	<img id = "aco_img" alt="" src="etc/image/hotelimg/hotelscombined.jpg" ></a><br/>
	<span align="center"><b>호텔스 컴바인</b><br/>
	</span>
	</div>
	
	<div class="hotel second">
	<a href="http://www.trivago.co.kr/">
	<img id = "aco_img" alt="" src="etc/image/hotelimg/trivago.png" name="hotelimg" ></a><br/>
	<span align="center"><b>트리바고</b><br/>
	</span>
	</div>
	
	<div class="hotel third">
	<a href="http://www.hotels.com/">
	<img id = "aco_img" alt="" src="etc/image/hotelimg/hotelscom.png" name="hotelimg"></a><br/>
	<span align="center"><b>호텔스 닷컴</b><br/>
	</span>
	</div>
	</div>

    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="pagefooter.jsp"></jsp:include>
</body>
</html>