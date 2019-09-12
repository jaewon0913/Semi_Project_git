<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>For Foreginer</title>

<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<style type="text/css">
#table_my {
	border-collapse: collapse;
	border: 2px solid #ccc;
}

#th_my {
	background-color: #EAEAEA;
	width: 144.67px;
	height: 86px;
	font-family: HanSans;;
	color: #333333;
	font-size: 15px;
	font-style: italic;
}

#td_my {
	width: 393.33px;
}

#text {
	padding: 6px 12px;
	width: 310px;
	height: 100%;
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-sizing: border-box;
	resize: none;
	font-size: 14px;
}

td {
	text-align: center;
}

#cancle_btn {
	/* data-text-content="true" ; */
	position: relative;
	font-size: 16px;
	color: rgb(64, 64, 64);
	text-align: center;
	line-height: 2.9em;
	border-radius: 4px;
	background-color: rgb(224, 224, 224);
	top: 350px;
	width: 130px;
	height: 50px;
	left: -40px;
}

#submit_btn {
	position: relative;
	font-size: 16px;
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.9em;
	border-radius: 4px;
	background-color: rgb(94, 94, 94);
	top: 350px;
	width: 130px;
	height: 50px;
	right: -40px;
}
</style>


</head>
<body>

	<jsp:include page="../pageheader.jsp"></jsp:include>
	<!-- body -->
	<!-- body -->
	<!-- body -->
	<!-- body -->
	<!-- body -->
	<!-- body -->
	<!-- body -->
	<div align="center">
		<h1
			style="font-family: HanSans; color: #333333; font-size: 30px; font-style: italic; line-height: 2.0em">find
			my pw</h1>
		<form action="member.do" method="post">
			<input type="hidden" name="command" value="findpwres" />

			<table border="1" id="table_my">
				<col width="100" />
				<col width="100" />
				<col width="100" />


				<tr>
					<th id="th_my">Name</th>
					<td id="td_my"><input type="text" name="name" id="text"
						placeholder="성함을 입력해주세요." /></td>
				</tr>
				<tr>
					<th id="th_my">ID</th>
					<td id="td_my"><input type="text" name="id" id="text"
						placeholder="아이디를 입력해주세요." /></td>
				</tr>

				<tr>
					<th id="th_my">E-mail</th>
					<td id="td_my"><input type="text" name="email" id="text"
						placeholder="회원가입시 작성한 이메일을 입력해주세요." /></td>
				</tr>

				<tr>

					<input type="button" value="취소" id="cancle_btn"
						onclick="location.href='loginform.jsp'" />
					<input type="submit" value="확인" id="submit_btn">

					<!-- <input type = "submit" value = "로그인" /> -->

				</tr>
			</table>
		</form>
	</div>


	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>