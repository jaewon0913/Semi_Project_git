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
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- include libraries(jQuery, bootstrap) -->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link rel = "stylesheet" href = "${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>


</head>
<style type="text/css">
th{
   background-color: #EAEAEA;
   height:50px;
   font-family: HanSans;;
   color:#333333;
   font-size:15px;
    font-style: italic; 
    width: 20%;
    
    
}

#table_my{
   border-collapse: collapse;
   border: 2px solid #ccc;
   margin: 30px auto;
   width: 500px;
   height: 20px ;
   text-align:center;
   
   
}

#th_my{
   background-color: #EAEAEA;
   width :144.67px;
   height:86px;
   font-family: HanSans;;
   color:#333333;
   font-size:15px;
    font-style: italic; 
    text-align: center;
   
   
}

#text{
   padding: 6px 12px;
    width: 310px;
    height: 50%;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    resize: none;
    font-size: 14px;
}
</style>

<body>
   <!-- header -->
   <jsp:include page="../../pageheader.jsp"></jsp:include>
   <!-- body -->
   <div>
      <div data-text-content="true"
      style="font-size: 35px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic; margin:5px auto;"
      class="" spellcheck="false">Free board</div>
      <table id="table_my">
         <tr>
            <th id="th_my">title</th>
            <td><input type="text" value=${dto.freeboard_title }
               readonly="readonly" id="text"/>
         </tr>
         <tr>
            <th id="th_my">writer</th>
            <td >${dto.freeboard_id }</td>
         </tr>
         <tr>
            <th id="th_my">content</th>
            <td>${dto.freeboard_content }</td>
         </tr>
         
      </table>
      <table align = "center">
      <tr >
            <td align = "center">
               <input type="button" value="Cancle" class="w3-button w3-red w3-round-small" onclick="history.go(-1)" />
            </td>
         <tr>
      </table>
   </div>

   
   <!-- footer -->
   <jsp:include page="../../pagefooter.jsp"></jsp:include>
</body>
</html>	