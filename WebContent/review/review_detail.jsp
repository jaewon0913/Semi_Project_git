<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://kit.fontawesome.com/27cb20e940.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
   
   <script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>
   
<script type="text/javascript">
$(function(){
   //댓글리스트 갱신 함수
   comment_list();
   
   $("#btnSave").click(function(){
      comment_add();
   });
   
});

function comment_add(){
//    alert($("#content").val());
   var param = {"boardno":${dto.reviewboard_no},
              "content":$("#content").val()};
   
   $.ajax({
      type: "post",
      url: "review.do?command=commentAdd",
      data: param,
      success: function(){ //서버에서 글쓰기가 완료되면
         $("#content").val(""); //입력한 내용을 지워라
         comment_list(); //댓글 목록을 새로고침 
      }
   });
   
}

function comment_list(){
   //비동기적인 방식으로 댓글 목록을 가져와서 div에 출력시킴
   $.ajax({
      type: "get",
      url:   "review.do?command=commentList",
      data:   "num=${dto.reviewboard_no }",
      success: function(msg){
         $("#commentList").html(msg);
      }   
   });
   
   }

</script>
<style type="text/css">

#table_my{
   border-collapse: collapse;
   border: 2px solid #ccc;
   margin: 30px auto;
   text-align: center;
   width: 500px;
   height: 20px ;
   
   
}

th{
   background-color: #EAEAEA;
   height:50px;
   font-family: HanSans;;
   color:#333333;
   font-size:15px;
    font-style: italic; 
    width: 30%;
    
    
}

#comment_table{
   margin: 0px auto;
   text-align: center;
   
}

#content{
   margin: 0px auto;
   text-align: left;
   border-color: #ccc;
}

#btnSave{
      position:relative;
   font-size: 16px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.9em;
    border-radius: 4px;
    background-color: rgb(94, 94, 94);
   top: 0px;
   width: 130px;
   height: 50px;
   right: -10px;
   margin: 0px auto;
}

.updateBtn{
   position:relative;
   font-size: 16px; 
   color: rgb(64, 64, 64); 
   text-align: center;
    line-height: 1.5em;
    border-radius: 3px; 
   background-color: white;
   top: 0px ;
   height: 1px auto;
   width: 0px auto;
   left : 7px;
}

#btns{
   position:relative;
   font-size: 16px; 
   color: rgb(64, 64, 64); 
   text-align: center;
    line-height: 1.5em;
    border-radius: 3px; 
   background-color: white;
   top: 0px ;
   height: 1px auto;
   width: 0px auto;
   left : 270px;
}

#btns2{
   position:relative;
   font-size: 16px; 
   color: rgb(64, 64, 64); 
   text-align: center;
    line-height: 1.5em;
    border-radius: 3px; 
   background-color: white;
   top: -20px ;
   height: 1px auto;
   right : 400px;
   float: right;
   
   

}

.list_btn{
   margin-right:5px;
}

</style>

</head>
<body>
   <jsp:include page="../pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->


   <div data-text-content="true"
         style="font-size: 35px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic; margin:20px auto;"
         class="" spellcheck="false">Review</div>

   <table border="1" id="table_my">
      <tr>
         <th >No.</th>
         <td>${dto.reviewboard_no }</td>
         
      </tr>
      <tr>
         <th>views</th>
         <td>${dto.reviewboard_hits }</td>
      </tr>
      
      <tr>
         <th>destination</th>
         <td>${category }</td>
      </tr>
      <tr>
         <th>writer</th>
         <td>${dto.reviewboard_id }</td>
      </tr>   
      <tr>
         <th>date</th>
         <td>
         <fmt:formatDate value="${dto.reviewboard_regdate }" pattern="yyyy-MM-dd hh:mm:ss"/>
         </td>
      </tr>   
      <tr>
         <th>title</th>
         <td>${dto.reviewboard_title }</td>
      </tr>   
      <tr>
         <th>content</th>
         <td>${dto.reviewboard_content }</td>
      </tr>
   </table>
   <br/><br/>
      
   <!-- 댓글 출력 코드 -->
   
   <div id="commentList"></div>   

   <!-- 댓글 입력 코드 -->
   <!-- 로그인해야 댓글 입력창 보임 로그인 안하면 댓글list만 보임 -->
   <c:if test="${ sessionScope.id ne null }">
   <table id="comment_table">
      <tr>
         <td>
         <textarea rows="3" cols="100" id="content" name="content"></textarea>
         </td>      
         <td>
         <button id="btnSave" type="button">comment</button>
         </td>
      </tr>
   </table>
   </c:if>
   

   
   <br/><br/>
   <!-- 버튼영역 -->
   <div class="BNTarea" id="updateBTN">
      <!-- 로그인해야 수정/삭제/답글 버튼 보임 , 글쓴이 본인이어야 수정/삭제 버튼 보임 -->
      <c:choose>
      <c:when test="${id.member_id eq dto.reviewboard_id }">
      <%-- <c:if test="${ sessionScope.id eq null or sessionScope.id eq dto.reviewboard_id }"> --%>
      <%-- <c:if test="${ sessionScope.id eq dto.reviewboard_id }"> --%>
         <input type="button" value="수정" onclick="location.href='review.do?command=updateform&boardno=${dto.reviewboard_no }&pagenum=${pagenum}'" id="btns">
        <input type="button" value="삭제" onclick="location.href='review.do?command=delete&pagenum=${pagenum}&contentnum=10&boardno=${dto.reviewboard_no }'"id="btns">    
         <input type="button" value="답글" onclick="location.href='review.do?command=answerform&boardno=${dto.reviewboard_no }&pagenum=${pagenum}'"id="btns">
      </c:when>
      <c:when test="${id.member_id eq 'admin' }">
          <input type="button" value="삭제" onclick="location.href='review.do?command=delete&pagenum=${pagenum}&contentnum=10&boardno=${dto.reviewboard_no }'"id="btns">    
         <input type="button" value="답글" onclick="location.href='review.do?command=answerform&boardno=${dto.reviewboard_no }&pagenum=${pagenum}'"id="btns">
      </c:when>
      <c:otherwise>
         <input type="button" value="답글" onclick="location.href='review.do?command=answerform&boardno=${dto.reviewboard_no }&pagenum=${pagenum}'"id="btns">
      </c:otherwise>
      </c:choose>
      <%-- </c:if> --%>
      
      <%-- </c:if> --%>
   </div>
   <div class="BNTarea" id="listBTN" >
      <input type="button" value="목록" onclick="location.href='review.do?command=reviewboard&pagenum=${pagenum}&contentnum=10'" id="btns2">
      <input type="button" value="최신목록" onclick="location.href='review.do?command=reviewboard&pagenum=1&contentnum=10'" id="btns2" class="list_btn">   
   </div>

    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="../pagefooter.jsp"></jsp:include>

</body>
</html>