<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<%@ page import="java.util.Calendar" %>   
<%@ page import="java.util.List" %>
<%@ page import="com.semi.tour.dto.tourUtil" %>
<%@ page import="com.semi.tour.dto.itemDto"%>
<%@ page import="java.io.PrintWriter" %>

<%@ page import = "com.semi.member.dto.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

   <script src="https://kit.fontawesome.com/27cb20e940.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

   <script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>


<script type="text/javascript">

   $(function(){
      $(".BB").click(function(){   
         
          var n = $('.BB').index(this);
          var num = $(".num:eq("+n+")").val();
             
          //1명부터 선택가능 
          if(num<=1){
             return false;
          }
             
          num = $(".num:eq("+n+")").val(num*1-1);   
    
           payment_count(n);
      });   
         
      $(".PP").click(function(){
             
         var n = $('.PP').index(this);
          var num = $(".num:eq("+n+")").val();
          num = $(".num:eq("+n+")").val(num*1+1); 

         payment_count(n);
             
      });      
      
      function payment_count(n){

         var num = $(".num:eq("+n+")").val();
         var cost =${cost};
             
         var param = {"peoplecount":num,
                     "cost":cost};
            
         $.ajax({
            type: "post",
            url: "tour.do?command=payment",
            datatype : "text",
            data: param,
            success:function(msg){
               $("#cost").html(msg);
            },
            error: function(){
               alert("실패");
            }
         });
                
        }   
   });

</script>

<script type="text/javascript">

     
    function kakao(data) {
       
       if($("#month input:checked").length==0){
          alert("날짜를 체크해주세요");
          return false;
       }
       
       if(${id.member_id eq null}){
          alert("로그인해주세요");
          return false;
       }
       
       
       var IMP = window.IMP; 
       IMP.init('imp88394636');      
        
        var id="${id.member_id}";
       var subject = $(".subject").html();
       var amount = $("input.num").val();
       var price = $("span.cost").html();
       var month = $(":input:radio[name=Dday]:checked").val();     

          
        IMP.request_pay({
         pg : 'kakaopay', 
         pay_method : 'card',
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : $("#subject").html(),
         amount :1,
         buyer_email : 'test@naver.com',
         buyer_name : id,
         buyer_tel : '010-1234-5678',
         buyer_addr : '서울특별시 강남구 역삼동',
         buyer_postcode : '123-456',
         m_redirect_url : 'https://www.yourdomain.com/payments/complete'

         },function(rsp) {
            if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
              jQuery.ajax({
               url: "tour.do?command=paymentInsert", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'text',
                data: {
                    "merchant_uid" : rsp.merchant_uid,   //date값
                    "id" : id,
                  "subject" : subject,
                  "amount" : amount,
                    "price" : price,
                    "month" : month
        
                    //기타 필요한 데이터가 있으면 추가 전달
                }
                     }).done(function(data) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                       if ( everythings_fine ) {
                           msg = '결제가 완료되었습니다.';
                           msg += '\n고유ID : ' + rsp.imp_uid;
                           msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                           msg += '\결제 금액 : ' + rsp.paid_amount;
                           msg += '카드 승인번호 : ' + rsp.apply_num;
                                         
                           alert(msg);
                           } else {
                                         //[3] 아직 제대로 결제가 되지 않았습니다.
                                         //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                            }
                        });
                              //성공시 이동할 페이지
                          alert("결제에 성공하였습니다!");
/*                           alert(amount);
                          alert(subject);
                          alert(price);
                          alert(month); */
                          location.href='tour.do?command=payinfoform&id=${id.member_id}';
                       } else {
                          msg = '결제에 실패하였습니다.';
                          msg += '에러내용 : ' + rsp.error_msg;
                          //실패시 이동할 페이지
                         location.href="tour.do?command=paymenterror";
                         alert(msg);
                         }
                   });   
                   }
      
</script>




<style type="text/css">
   body{
   background-color: #EAEAEA;
    color:#333333;
    font-size:15px;
    position: relative;
    width: 100%;
    
    }
    
   #cost{
   color: red;
   }
   
   a{
   text-decoration: none;
   }
   
   #calendar{
   border: 1px solid gray;
    border-top: 1px solid #444444;
    border-collapse: collapse;
   
   }
   
   #calendar tr td{
   
   border-bottom: 1px solid #444444;
    padding: 10px;
   }
   
   #calendar td{
   text-align: right;
   vertical-align: top;
   position: relative;
   
   }
   #select ul{
   list-style:none;
    margin:0;
    padding:0;
   
   }
   
   #select li{
   margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
   
   }
   .schedule td{
   height: 50px;
   
   }
</style>

</head>
<%
   
   List<itemDto> list1 = (List<itemDto>) request.getAttribute("listday1");
   List<itemDto> list2 = (List<itemDto>) request.getAttribute("listday2");
   List<itemDto> list3 = (List<itemDto>) request.getAttribute("listday3");
   List<itemDto> list4 = (List<itemDto>) request.getAttribute("listday4");
   List<itemDto> list5 = (List<itemDto>) request.getAttribute("listday5");
   List<itemDto> list6 = (List<itemDto>) request.getAttribute("listday6");
   List<itemDto> list7 = (List<itemDto>) request.getAttribute("listday7");   
%>
<body>
   <jsp:include page="pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->


    
<!-- title -->



<!-- body-header 왼쪽부분 -->

   <div id="container" style="margin-bottom: 119%;">
   <!-- =================지도시작================ -->

   <div class="top" id="map" style="width:30%;height:450px; position: absolute; left: 20%; margin-top: 5%;" ></div>    

   
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b94db58cb1cfe77025a26e567a717718"></script>
   <script type="text/javascript">
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = { 
       center: new daum.maps.LatLng(37.568675, 126.977946), // 지도의 중심좌표
       level: 14 // 지도의 확대 레벨
   };  
   
   var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
   //선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
   var linePath = [
       new daum.maps.LatLng(37.568675, 126.977946),
       new daum.maps.LatLng(35.948451, 126.957739),
       new daum.maps.LatLng(35.824419, 127.148001),
       new daum.maps.LatLng(35.732078, 126.733508),
       new daum.maps.LatLng(34.812102, 126.392219),
       new daum.maps.LatLng(34.771667, 127.080121),       
       new daum.maps.LatLng(34.950909, 127.487324),
       new daum.maps.LatLng(34.760721, 127.662285),
       new daum.maps.LatLng(35.180578, 128.108812),
       new daum.maps.LatLng(35.539910, 129.311453),
       new daum.maps.LatLng(35.856476, 129.224792),
       new daum.maps.LatLng(35.875365, 128.601292),
       new daum.maps.LatLng(36.361052, 128.697608), 
       new daum.maps.LatLng(36.568733, 128.729533),
       new daum.maps.LatLng(37.172928, 128.986157),
       new daum.maps.LatLng(37.380881, 128.660921),
       new daum.maps.LatLng(37.183923, 128.461826)
       
       
   ];
   
   // 지도에 표시할 선을 생성합니다
   var polyline = new daum.maps.Polyline({
       path: linePath, // 선을 구성하는 좌표배열 입니다
       strokeWeight: 5, // 선의 두께 입니다
       strokeColor: '#C71212', // 선의 색깔입니다
       strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
       strokeStyle: 'solid' // 선의 스타일입니다
   });

   
   // 지도에 선을 표시합니다 
   polyline.setMap(map); 
   
</script>   
   

   <!-- 달력&지도?끝 -->


<!-- body-header 오른쪽부분 -->
<div class="topbody rt" style=" position: absolute; right:19%; margin-top: 5%;  " >
   <!-- 인원/날짜 선택 가격표시-->
   <div >
      <h2 class="subject" id="subject">${subject }</h2>
      <br/>
      <table id="select" >
      <col width="100px;">
      <col width="200px;">
         <tr>
            <td>Select Date</td>
            <td>
            
            <div id="month">
            <span>July</span><br/>
         
               <input type="radio" value="0707" name="Dday" class="Dday">07
               <input type="radio" value="0714" name="Dday" class="Dday">14
               <input type="radio" value="0721" name="Dday" class="Dday">21
               <input type="radio" value="0728" name="Dday" class="Dday">28
               
               <br/><br/>

            <span>August</span><br/>               
               <input type="radio" value="0804" name="Dday" class="Dday">4
               <input type="radio" value="0811" name="Dday" class="Dday">11
               <input type="radio" value="0818" name="Dday" class="Dday">18
               <input type="radio" value="0821" name="Dday" class="Dday">21
            </div>   
   
            </td>
         </tr>
         <tr>
            <td>인원선택</td>
            <td >
            <div>
               <button class="BB" style="text-align: center; height: 40px; width: 20px;">
               <span class="ir">-</span>
               </button>
               <input type="text" value="1"  style=" text-align: center; width: 51px;" name="num" id="num" class="num">
               <button class="PP" style="text-align: center; height: 40px; width: 20px;">
               <span class="ir">+</span>
               </button>
            </div>
            </td>
         </tr>
         <tr>

            <td colspan="2" align="center" style="height: 30px;">   
            <span id="cost" class="cost" name = "cost" style="font-size:xx-large;">${cost }</span>
            </td>            
         </tr>
         <tr>
            <!-- 결제/(상담??) 버튼 이미지로 넣기~!? -->
            
            <td colspan="2" align="center">
            <a id="pay" href="javascript:void(0);" onclick="kakao(${cost })">
               <img alt="kakaoerror" src="./etc/image/icon/kakaopay.png" style="width: 40%;">            
            </a>
         
            </td>
         </tr>
      
      </table>   
   </div>
</div>

<!-- body-body부분  -->

   <!-- 일정 상세보기/탭으로 나눌지말지 고민... -->

     <div style="position: absolute; margin-top: 40%; left: 20%;" >
     <div><h2>detail schedule</h2></div>
      
      <table class="schedule">
      <col width="100px">
      <col width="150px">
      <col width="600px"> 
      
      <tbody>   
         <tr style="border: 1px solid;">
         <td ><strong>date</strong></td><td><strong>city</strong></td><td ><strong>details</strong></td>
         </tr>
         <tr>
         <td rowspan="<%= list1.size()+1%>">DAY1</td>
         </tr>         
<%
         for(int i=0; i<list1.size();i++){
            itemDto dto = list1.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list2.size()+1%>">DAY2</td>
         </tr>         
<%
         for(int i=0; i<list2.size();i++){
            itemDto dto = list2.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list3.size()+1%>">DAY3</td>
         </tr>         
<%
         for(int i=0; i<list3.size();i++){
            itemDto dto = list3.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list4.size()+1%>">DAY4</td>
         </tr>         
<%
         for(int i=0; i<list4.size();i++){
            itemDto dto = list4.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list5.size()+1%>">DAY5</td>
         </tr>         
<%
         for(int i=0; i<list5.size();i++){
            itemDto dto = list5.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list6.size()+1%>">DAY6</td>
         </tr>         
<%
         for(int i=0; i<list6.size();i++){
            itemDto dto = list6.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
         <tr>
         <td rowspan="<%= list7.size()+1%>">DAY7</td>
         </tr>         
<%
         for(int i=0; i<list7.size();i++){
            itemDto dto = list7.get(i);
%>            <tr>
            <td><%=dto.getItem_city() %></td>
            <td ><%=tourUtil.setPlacelist(dto.getItem_place()) %></td></tr>
<%            
         }

%>
      </tbody>   
      </table>
      </div>
      
</div>

<script type="text/javascript">


   $(function(){
      $("span.placename").click(function(){
         var index = $("span.placename").index(this);
//           alert(index);
          var placename = $("span.placename").eq(index).html();
//           alert(placename);
          
          var param = {"query" : placename};
          
          $.ajax({
             type: "post",
             url: "tour.do?command=placedetail",
             datatype: "text",
             data: param,
             success: function(msg){
//                 alert("성공!");
             },
             error: function(){
//                 alert("실패!");
             }
             
          });
         
      });
      
   });

</script>      
   
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="pagefooter.jsp"></jsp:include>   

   
</body>
</html>