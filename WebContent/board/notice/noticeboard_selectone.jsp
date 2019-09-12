<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

</head>
<body>
	<jsp:include page="../../pageheader.jsp"></jsp:include>
	<!-- body -->
	<h1 align="center">공지사항</h1>
	<hr />

	<div align="center">
		<table border = "1">
		<col width = "150">
		<col width = "300">
		<col width = "150">
		<col width = "100">
			<thead>
				<tr>
					<th>제목</th>
					<th colspan = "3">${dto.noticeboard_title }</th>
				</tr>
				<tr>
					<th>작성일</th>
					<th>${dto.noticeboard_regdate }</th>
					<th>조회수</th>
					<th>${dto.noticeboard_click_count }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>내용</th>
					<td colspan = "3" style = "height : 300px; vertical-align: top;">${dto.noticeboard_content }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/>
	<div align = "center">
		<c:choose>
			<c:when test="${id eq 'admin' }">
				<input type = "button" value = "delete" onclick = "" />
				<input type = "button" value = "update" onclick = "" /> 
				<input type = "button" value = "back" onclick = "location.href='board.do?command=noticeboardform'" />
			</c:when>
			<c:otherwise>
				<input type = "button" value = "back" onclick = "location.href='board.do?command=noticeboardform'" />
			</c:otherwise>
		</c:choose>
	</div>
	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="../../pagefooter.jsp"></jsp:include>
</body>
</html>