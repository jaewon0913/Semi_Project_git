<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel = "stylesheet" href = "${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

</head>

<style type="text/css">
a {
   text-decoration: none;
}

.tr {
   display: inline-block;
   padding-left: 30px;
}

.writeBtn {
   padding-left: 50%;
}

.serach {
   padding-left: 50%;
   padding-top: 1%;
}

#tr_my {
   background-color: #EAEAEA;
   width: 144.67px;
   height: 30px;
   font-family: HanSans;
   color: black;
   font-size: 14px;
   border-top-color: #ccc;
   border-bottom-color: #ccc;
}

#thead {
   top: 500px;
   border-bottom: 1px solid; 
   border-bottom-color: #ccc;
   border-top:1px solid; 
   border-top-color: #ccc
}

#table_my {
   border-collapse: collapse;
   border-bottom-color: #ccc;
   left: 0px;
}

#write_btn {
   position: absolute;
   font-size: 16px;
   color: rgb(255, 255, 255);
   text-align: center;
   line-height: 2.0em;
   border-radius: 4px;
   background-color: rgb(94, 94, 94);
/*    top: 10px; */
/*    right: 350px; */
/*    height: 1px auto; */
   left:820px;
   margin: auto;

}

.serachBox tablearea {
   width: 60%;
   margin: auto;
   text-align: center;
}

.fullContent {
   float: left;
   width: 1500px;
   margin: 20px auto;
   text-align: center;
   padding: 50px 20px;
}

.paging tr {
   margin: 0px auto;
   text-align: center;
   width: 100%;
}

th{
   border-right-color: thick white;
}



#paging_out {
   float: none;
   width: 100px;
   text-align: center;
   margin: 0px auto;
}

#paging_in {
   display: inline-block;
}

tbody {
   border-bottom-color: #ccc;
}
</style>
</head>
<body>
   <jsp:include page="../../pageheader.jsp"></jsp:include>
   <!-- body -->
   <div data-text-content="true"
      style="font-size: 35px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic; margin: auto;"
      class="" spellcheck="false">Free board</div>
   <hr/>
   <div id = "body">
   </div>
   <table align="center"  id="table_my">
      <col width="50">
      <col width="300">
      <col width="100">
      <col width="200">
      <thead id="thead">
         <tr id="tr_my">
            <c:if test="${id.member_id eq 'admin'}">
               <th><input type="checkbox" /></th>
            </c:if>
            <th>No.</th>
            <th>title</th>
            <th>writer</th>
            <th>date</th>
         </tr>
      </thead>
      <tbody >
         <c:choose>
            <c:when test="${empty list }">
               <tr>
                  <td colspan="5" align="center">========작성된 글이 없습니다.========</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <tr>
                     <c:if test="${id.member_id eq 'admin' }">
                        <td><input type="checkbox" /></td>
                     </c:if>
                     <td>${dto.freeboard_no }</td>
                     <td><c:forEach begin="1" end="${dto.freeboard_titletab }">
                              &nbsp;
                           </c:forEach> <c:forEach begin="1" end="${dto.freeboard_titletab }">RE:</c:forEach>
                        <c:choose>
                           <c:when test="${dto.freeboard_delenabled eq 'N' }">
                              <c:out value="${dto.freeboard_title }"></c:out>
                           </c:when>
                           <c:otherwise>
                              <a
                                 href="board.do?command=freeboardselectone&freeboardno=${dto.freeboard_no }">${dto.freeboard_title }</a>
                           </c:otherwise>
                        </c:choose></td>
                     <td>${dto.freeboard_id }</td>
                     <td>${dto.freeboard_regdate }</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
   <jsp:include page="/paging/freeboardpaging.jsp">
      <jsp:param value="${paging.page}" name="page" />
      <jsp:param value="${paging.beginPage}" name="beginPage" />
      <jsp:param value="${paging.endPage}" name="endPage" />
      <jsp:param value="${paging.prev}" name="prev" />
      <jsp:param value="${paging.next}" name="next" />
   </jsp:include>
   <input type="button" value="write"
      onclick="location.href='board.do?command=freeboardwriteform&id=${id.member_id}'" id="write_btn">

   <!-- ============================== F O O T E R ======================================== -->
   <jsp:include page="../../pagefooter.jsp"></jsp:include>
</body>
</html>