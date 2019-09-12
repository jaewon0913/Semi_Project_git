<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">

sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");

function loginform(){
	$("#loginform").show();
}

function canclelogin(){
	var input_id = document.getElementsByName("id")[0];
	var input_pw = document.getElementsByName("pw")[0];
	input_id.value = "";
	input_pw.value = "";
	$("#loginform").hide();
}

</script>

</head>
<style type = "text/css">
    body{
        padding: 0px;
        margin: 0px;
    }

    #abc{
        width: 100%;
        height: auto;
        z-index: 1;
    }
</style>

<body>
	<div style="width: 100%; height: 100%">
   		<video id="abc" src="etc/video/pagevideo.mp4" type="video/mp4" preload="auto;" autoplay="true;" loop="loop" muted="muted" onclick = "location.href='board.do?command=mainhome'">
   	 	</video>
	</div>
</body>
</html>