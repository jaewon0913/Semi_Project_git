<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#inputMessage{
		width : 60%;
		padding : 0;
	}
	.inputchat #input1{
		left : 50px;
	}
</style>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			$(".chat").click(function() {
				$("#chatbox").css("display", "block");
				$(".k_map").css("display","none");
			})
		});
		
		function closechat(){
			alert("챗종료버튼");
			$("#chatbox").css("display", "none");
		}
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/chat.js?ver=1"></script>
	<c:if test="${empty id }">
		<input type="hidden" value="비회원사용자" id="chat_id" />
	</c:if>
	<c:if test="${!empty id }">
		<input type="hidden" value="${id.member_id}" id="chat_id" />
	</c:if>
	<div style="position: relative; display: none; width : 500px; height : 47px; right : 485px" id="chatbox">
		<textarea id="messageWindow" rows="15" cols="62" readonly="readonly"></textarea>
		<br />
		<input class = "inputchat" id = "inputMessage" type="text" onkeyup="enterkey()" />
		<input class = "inputchat" id = "input1" type="submit" value="send" onclick="send()" /> 
		<input class = "inputchat" id = "input2" type="button" value="close" onclick="closechat()" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/chat.js?ver=1"></script>
	</div>

</body>
</html>