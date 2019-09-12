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
</head>
<body>



	<div align="center">
		<h1>로그인</h1>
		<h4>아이디와 비밀번호를 입력해주세요</h4>
		<form action="member.do" method="post">
			<input type="hidden" name="command" value="login" />

			<table border="1">
				<col width="100" />
				<col width="100" />


				<tr>
					<th>I D</th>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<th>PassWord</th>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="ID찾기" onclick="location.href='findId.jsp'" /> <input
						type="button" value="PW찾기" onclick="location.href='findPw.jsp'">
						<input type="button" value="회원가입"
						onclick="location.href='normalregistform.jsp'" /> <input
						type="submit" value="로그인" /></td>
			</table>
		</form>
	</div>

	<div class="fb-like" data-share="true" data-width="450"
		data-show-faces="true"></div>

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.3&appId=452413625522628&autoLogAppEvents=1">
		
	</script>

	<div class="fb-login-button" data-width="" data-size="large"
		data-button-type="login_with" data-auto-logout-link="true"
		data-use-continue-as="false" scope="public_profile,email"
		onlogin="checkLoginState();"></div>

</body>
</html>