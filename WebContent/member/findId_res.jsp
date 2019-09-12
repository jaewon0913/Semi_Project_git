<%@page import="com.semi.member.dto.memberdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For Foreginer</title>

	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

	
	<style type="text/css">
    
    #table_my{
	border-collapse: collapse;
	border: 2px solid #ccc;
	
}

#th_my{
	background-color: #EAEAEA;
	width :144.67px;
	height:86px;
	font-family: HanSans;;
	color:#333333;
	font-size:15px;
 	font-style: italic; 
	
	
}

#td_my{
	width: 393.33px;
}

#text{
	padding: 6px 12px;
    width: 310px;
    height: 100%;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    resize: none;
    font-size: 14px;
}

td{
	text-align: center;
}

#cancle_btn{
/* data-text-content="true" ; */
	position:relative;
	font-size: 16px; 
	color: rgb(64, 64, 64); 
	text-align: center; 
	line-height: 2.9em; 
	border-radius: 4px; 
	background-color: rgb(224, 224, 224);
	top: 270px;
	width: 130px;
	height: 50px;
	left: -40px;
}

#home_btn{
	position:relative;
	font-size: 16px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.9em;
    border-radius: 4px;
    background-color: rgb(94, 94, 94);
	top: 100px;
	width: 130px;
	height: 50px;
	left: 190px;
}

#id_res{
 	
	background-color: #ccc;
	color: #333333;
	font-weight: bold;
}
    
    
    
	</style>
	
</head>
<body>
	<jsp:include page="../pageheader.jsp"></jsp:include>
	
	<!-- body -->
   <table style="text-align: center;margin: auto;">
      <col width="150px">
      <col width="200px">
      
      <h1 style="font-family: HanSans;color:#333333;font-size:30px;font-style: italic;line-height: 2.0em; text-align: center;" >find my id</h1>
     
    
      <tr height="30px">
         <td id="td_my">${dto.member_name }님의 아이디는</td> <td id="id_res">${dto.member_id }</td><td id="td_my">입니다.</td>
        
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="button" value="홈으로" onclick="location.href='board.do?command=mainhome'" id="home_btn">
         </td>
      </tr>
   </table>
	
	<!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>


