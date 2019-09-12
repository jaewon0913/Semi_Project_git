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

<!-- include summernote css/js-->
<link
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
   
<link rel = "stylesheet" href = "${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<script type="text/javascript">
   $(document).ready(
         function() {
            $('#summernote').summernote(
                  {
                     width : 800,
                     height : 400,
                     maxHeight : null,
                     minHeight : null,
                     fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
                           'Comic Sans MS', 'Courier New', ],
                     fontNamesIgnoreCheck : [ '맑은고딕' ],
                     focus : true,
                     lang : 'ko-KR',
                  });
         });
   $('.dropdown-toggle').dropdown();

   function write() {
      var markup = $('#summernote').summernote('code');
      alert(markup);
   }
</script>
<style type="text/css">
#summernote {
   width: 50%;
}
</style>

</head>

<body>
   <jsp:include page="../../pageheader.jsp"></jsp:include>
   <!-- body -->
   <div style="margin: 0px auto; width: auto;text-align: center;">
      <div data-text-content="true"
      style="font-size: 35px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic; margin: auto;"
      class="" spellcheck="false">Free board</div>
      <hr/>
      <div>
      <form action="board.do?command=freeboardwrite" method="post" >
      <table align="center">   
         <tr>
            <td>
               <input type="hidden" name="id" value=${id.member_id }> 
               <input type="text" class="form-control form-control-lg" name="title"
                  placeholder="제목" style="width: 800px" />
               <textarea id="summernote" name="content" class="summernote"></textarea>
            </td>
         </tr>
         <tr>
            <td align = "center">
               <input type="submit" value="Write" class="w3-button w3-black w3-round-small" /> 
               <input type="button" value="Cancle" class="w3-button w3-red w3-round-small" onclick="history.go(-1)" />
            </td>
         <tr>
      </table>   
      </form>
      
   </div>
   </div>
   <!-- footer -->
   <jsp:include page="../../pagefooter.jsp"></jsp:include>
</body>
</html>