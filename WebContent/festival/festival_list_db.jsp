<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/festival.js?ver=1"></script>
<style type="text/css">
</style>
</head>
<body>
<!-- DB에저장하기 -->
	<form action="festival.do" method="post">
		<input type="hidden" name="command" value="Festival_db"> <input
			type="submit" value="DB에 저장">
		<table>
			<thead></thead>
			<tbody></tbody>
		</table>
	</form>
</body>
</html>