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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>


<style type="text/css">
table.table_css {
	border-collapse: separate;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 20px 10px;
}

/* top-left border-radius */
table.table_css tr:first-child th:first-child {
	border-top-left-radius: 10px;
}

/* top-right border-radius */
table.table_css tr:first-child th:last-child {
	border-top-right-radius: 10px;
}

/* bottom-left border-radius */
table.table_css tr:last-child td:first-child {
	border-bottom-left-radius: 10px;
}

/* bottom-right border-radius */
table.table_css tr:last-child td:last-child {
	border-bottom-right-radius: 10px;
}

table.table_css thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: skyblue;
	margin: 20px 10px;
}

table.table_css tbody th {
	padding: 10px;
}

table.table_css td {
	font-weight: normal;
	padding: 10px;
	vertical-align: top;
	padding: 10px;
}

table.table_css .even {
	background: #E0FFFF;
}
</style>
</head>
<body>

	<jsp:include page="../../pageheader.jsp"></jsp:include>
	<!-- body -->
	<h1 align="center">공지사항</h1>
	<hr />
	<div align="center">
		<table class="table_css" style="margin-bottom: 10px; TABLE-layout: fixed">
			<col width="100" />
			<col width="500" />
			<col width="200" />
			<col width="150" />
			<col width="100" />
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="5" align="center">========작성된 글이 없습니다.========</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto" varStatus="status">
							<c:choose>
								<c:when test="${status.count%2 == 0 }">
									<tr>
										<td class="even">${dto.row_num }</td>
										<td class="even"
											style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><a
											href="board.do?command=noticeboardselectone&noticeboardno=${dto.noticeboard_no }">${dto.noticeboard_title }</a>
										</td>
										<td class="even">${dto.noticeboard_id }</td>
										<td class="even">${dto.noticeboard_regdate }</td>
										<td class="even">${dto.noticeboard_click_count }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${dto.row_num }</td>
										<td><a
											href="board.do?command=noticeboardselectone&noticeboardno=${dto.noticeboard_no }">${dto.noticeboard_title }</a>
										</td>
										<td>${dto.noticeboard_id }</td>
										<td>${dto.noticeboard_regdate }</td>
										<td>${dto.noticeboard_click_count }</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<jsp:include page="/paging/noticeboardpaging.jsp">
		<jsp:param value="${paging.page}" name="page" />
		<jsp:param value="${paging.beginPage}" name="beginPage" />
		<jsp:param value="${paging.endPage}" name="endPage" />
		<jsp:param value="${paging.prev}" name="prev" />
		<jsp:param value="${paging.next}" name="next" />
	</jsp:include>
	<input type="button" value="글작성"
		onclick="location.href='board.do?command=noticeboardwriteform&id=${id.member_id}'">

	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="../../pagefooter.jsp"></jsp:include>
</body>
</html>