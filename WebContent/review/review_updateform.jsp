<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<!--     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#summernote').summernote(
						{
							width : 800,
							height : 400,
							maxHeight : null,
							minHeight : null,
							fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
									'Comic Sans MS', 'Courier New', ],
							fontNamesIgnoreCheck : [ '맑은고딕' ],
							focus : true,
							lang : 'ko-KR',
						});
			});
	$('.dropdown-toggle').dropdown();

	function write() {
		var markup = $('#summernote').summernote('code');
		alert(markup);
	}
</script>

</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->

	<form method="post" action="review.do">
		<input type="hidden" name="command" value="update"> <input
			type="hidden" name="boardno" value="${dto.reviewboard_no }">
		<input type="hidden" name="pagenum" value="${pagenum }">
		<div data-text-content="true"
			style="font-size: 35px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic; margin: auto;"
			class="" spellcheck="false">Review</div>
		<div id="review_write_out">
			<div id="review_write_in">
				<table>
					<tr>
						<th>destination:</th>
						<td colspan="2" align="center"
							style="float: center; border-color: #ccc; width: 130px; height: 25px;">
							<select name="category">
								<option value="1">서울</option>
								<option value="2">인천</option>
								<option value="3">대전</option>
								<option value="4">대구</option>
								<option value="5">광주</option>
								<option value="6">부산</option>
								<option value="7">울산</option>
								<option value="8">세종</option>
								<option value="31">경기도</option>
								<option value="32">강원도</option>
								<option value="33">충청도</option>
								<option value="34">경상도</option>
								<option value="35">전라도</option>
								<option value="36">제주도</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>writer:</th>
						<td style="font-size: 20px;">${id.member_id }<input
							type="hidden" name="id" value="${dto.member_id}"
							style="float: left;"></td>
					</tr>

					<tr>
						<th>title:</th>
						<td><input type="text" name="title"
							value="${dto.reviewboard_title }"></td>
					</tr>
					<tr>
						<th>content:</th>
						<td><textarea id="summernote" name="content">${dto.reviewboard_content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Edit"
							id="edit_btn"> <input type="button" value="Cancle"
							onclick="location.href='review.do?command=boarddetail&boardno=${dto.reviewboard_no }&hits=${dto.reviewboard_hits}&pagenum=${pagenum}'"
							id="cancle_btn"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="../pagefooter.jsp"></jsp:include>

</body>
</html>