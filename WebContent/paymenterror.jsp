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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css">

	<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js"></script>


<style type="text/css">

	body{
	background-color: #EAEAEA;
    color:#333333;
    font-size:15px;
    position: relative;
    width: 100%;
    
    }
</style>

</head>
<body>

	<jsp:include page="pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->





	<div style=" margin-bottom: 35%;">
	<h1 style="color: red; position: absolute; left: 45%; margin-top: 15%;">e r r o r ! ! !</h1>

	
	  <div style="position: absolute; left: 45%; margin-top: 30%; ">
	<a href="member.do?command=mainhome">
	<h1>〈  H O M E 〉</h1>
	</a>
	</div>
	</div>
	
	
	<!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="pagefooter.jsp"></jsp:include>	

</body>
</html>