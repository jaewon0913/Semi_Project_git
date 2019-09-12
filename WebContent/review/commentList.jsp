<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#comment_span{
   margin: 0px auto;
   text-align: center;
   padding: 360px;
}

#comment_insert{
   margin: 0px auto;
   border-collapse: collapse;
   width: 800px;   
   border: 1px solid #444444;
   
}
#comment_insert tr, td{
   border-bottom: 1px solid #444444;
    padding: 10px;
}



</style>
</head>


<body>
   <span id="comment_span" style="font-size: 14px;">댓글${cnt }개</span>

   <table id="comment_insert">
   <col width="80%">
   <col width="20%">
   
      <c:forEach items="${list }" var="row">
      <tr>
         <td align="left">
            <span style="font-size: 12px;"><strong>${row.commentboard_id }</strong></span>   
            <span style="font-size: 10px;">(<fmt:formatDate value="${row.commentboard_regdate }" pattern="yyyy-MM-dd hh:mm:ss"/>)</span><br>
            <span style="font-size: 12px;">${row.commentboard_content }</span>
         </td>
         <td align="right">
          <a href="#" onclick="" style="font-size: 12px;">답글</a>
         │<a href="#" onclick="" style="font-size: 12px;">수정</a>
         │<a href="#" onclick="" style="font-size: 12px;">삭제</a>
         </td>
      </tr>      
      </c:forEach>
   </table>


</body>
</html>