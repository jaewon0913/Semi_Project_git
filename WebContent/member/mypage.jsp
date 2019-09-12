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

<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

<style type="text/css">
.mypage_menu {
   position:relative;
   padding-left: 50%;
   float: none;
   width: 100px;
   text-align: center;
   margin: 0px auto;
   top:800px;
   }
   #myinfo_out{
   float: none;
   width: 100px;
   text-align: center;
   margin: 0px auto;
   top:800px;
}
#myinfo_in{

   display: inline-block;
   
}
</style>

</head>
<body>
   <jsp:include page="../pageheader.jsp"></jsp:include>
   <!-- body -->
   <div data-text-content="true"
      style="font-size: 35px; line-height: 5.5em; text-align: center; font-weight: normal; font-style: italic;"
      class="">my page</div>
   <div data-obj-id="IsWcl" data-obj-type="element"
         data-text-editable="true" class="ui-selectee"
         style="position: relative; width:100px;height: 30px;margin: 0px auto;">
         <a href="member.do?command=membereditform&id=${id.member_id }" data-text-content="true"
            style="font-size: 16px; font-weight: bold; font-style: italic;"
            class="" spellcheck="false">My-info</a>
      </div>
   
   
      <div style="background-color: rgba(255, 255, 255, 0.29); font-size: medium; width:370px;height: 100px;margin: 0px auto;">
            회원이신 고객님의 개인정보를 관리하는 공간으로 개인정보를 확인하고 수정하실 수 있습니다. </div>

   <div data-obj-id="IsWcl" data-obj-type="element"
         data-text-editable="true" class="ui-selectee"
         style="position: relative; width:100px;height: 30px;margin: 0px auto;">
         <a href="tour.do?command=payinfoform&id=${id.member_id }" data-text-content="true"
            style="font-size: 16px; font-weight: bold; font-style: italic;"
            class="" spellcheck="false">Order-List</a>
      </div>
   
   
      <div style="background-color: rgba(255, 255, 255, 0.29); font-size: medium; width:370px;height: 100px;margin: 0px auto;">
            회원님이 예약하신 상품을 관리하는 페이지</div>


   <!-- ============================== F O O T E R ======================================== -->
   <!-- ============================== F O O T E R ======================================== -->
   <!-- ============================== F O O T E R ======================================== -->
   <jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>