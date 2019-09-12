<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>

	<h1>전국 축제 목록</h1>
	
	<table border="1">
		<col width="200">
		<col width="100">
		<col width="95">
		<col width="95">
		<col width="100">
		<col width="120">
		<col width="100">
		<col width="100">
		<col width="130">
		
		<tr>
			<th>번호</th>
			<th>축제명</th>
			<th>축제장소</th>
			<th>축제시작일자</th>
			<th>축제종료일자</th>
			<th>축제주요내용</th>
			<th>전화번호</th>
			<th>축제홈페이지</th>
			<th>소재지도로명주소</th>
			<th>제공기관명</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">-----작성된 글이 존재하지않습니다.-----</td>
				</tr>
			</c:when>
			<c:otherwise>
			 	<c:forEach items="${list }" var="dto">
			 		<tr>
			 			<td>${dto.festival_seq }</td>
			 			<td>${dto.festival_name }</td>
			 			<td>${dto.festival_place }</td>
			 			<td>${dto.festival_start }
			 			<td>${dto.festival_end }</td>
			 			<td>${dto.festival_con }</td>
			 			<td>${dto.festival_num }</td>
			 			<td>${dto.homepage }</td>
			 			<td>${dto.address }</td>
			 			<td>${dto.agency }</td>
			 		</tr>	
			 		
			 	</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
</body>
</html>