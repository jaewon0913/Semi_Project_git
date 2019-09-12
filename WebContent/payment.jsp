<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
    
    a{
    text-decoration:  none;
    
    }





</style>


</head>
<body>
	<jsp:include page="pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->


<div id="container" style="margin-bottom: 32%;">

	<h1 style="position: absolute; left: 45%;">Order List</h1>

	<div style="position: absolute; left: 14%; margin-top: 10%;">
	<table border="1">
	<col width="200">
	<col width="200">
	<col width="200">
	<col width="200">
	<col width="300">
		<tr>
		<th>merchandise</th>
		<th>D-day</th>
		<th>amount</th>
		<th>price</th>
		<th>order date</th>		
		</tr>
		
		<c:forEach items="${list }" var="dto" >
		<tr>		
			<td align="center">${dto.payment_subject }</td>
			<td align="center">${dto.payment_mdate }</td>
			<td align="center">${dto.payment_amount }</td>
			<td align="center">${dto.payment_price }</td>
			<td align="center">
			<fmt:formatDate value="${dto.payment_regdate }" pattern="yyyy-dd-mm hh:mm:ss"/>			
			</td>
		</tr>
		</c:forEach>
	</table>
   </div>
   
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