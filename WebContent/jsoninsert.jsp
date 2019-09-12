<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/insert.js?ver=1"></script>



</head>
<body>

<h1><b>jdbc썼음 jdbctemplate id 주소부분 수정해야함!!</b></h1>

<button id="item01">item01</button><br/><br/>

<button id="place1">place1</button><br/><br/>
<button id="place2">place2</button><br/><br/>
<button id="place3">place3</button><br/><br/>
<button id="place4">place4</button><br/><br/>


<a href="tour.do?command=product">product.jsp페이지로 이동</a> <br/>





</body>
</html>