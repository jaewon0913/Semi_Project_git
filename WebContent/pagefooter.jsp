<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<title>Insert title here</title>
</head>
<body>
   <div id="footer">
      <div id="foot_info">
            <div class="center">
                <div class="footer_ele foot_select foot_dropdown">
                    <h3>
                        Quick Link 
                    </h3>
                    <i class="fas fa-plus plus" ></i>
                    <i class="fas fa-minus minus" ></i>
                    <ul class="foot_dropdown_menu">
                        <li><a href="festival.do?command=monthfestival"><span>Travel Spot</span></a></li>
                        <li><a href="board.do?command=planning"><span>Planning</span></a></li>
                        <li><a href="review.do?command=reservation"><span>Accommodation</span></a></li>
                        <li><a href="board.do?command=freeboardpagelist"><span>Board</span></a></li>
                        <li><a href="review.do?command=reviewboard&pagenum=1&contentnum=10"><span>Reviews</span></a></li>
                    </ul>
                </div>
                <div class="footer_ele foot_dropdown">
                    <h3>Team Member</h3>
                    <i class="fas fa-plus plus" ></i>
                    <i class="fas fa-minus minus" ></i>
                    <ul class="foot_dropdown_menu">
                        <li>Hwang Jae Won</li>
                        <li>Lee Yeong Han</li>
                        <li>Yu Seul Gi</li>
                        <li>Song Ye Rin</li>
                        <li>Moon Hui Soo</li>
                    </ul>
                </div>
            </div>
            <div class="center">
                <div class="footer_ele foot_dropdown">
                    <h3>Location</h3>
                    <i class="fas fa-plus plus" ></i>
                    <i class="fas fa-minus minus" ></i>
                    <p class="foot_dropdown_menu">
                        6, Teheran-ro 14-gil<br>
                        Namdo 2th, 3th, 4th, 5th <br>
                        floor<br>
                        Gangnam-gu, Seoul<br>
                        Republick of Korea
                    </p>
                </div>
                <div class="footer_ele foot_select foot_dropdown">
                    <h3>Contact us</h3>
                    <i class="fas fa-plus plus" ></i>
                    <i class="fas fa-minus minus" ></i>
                    <ul class="foot_dropdown_menu">
                        <li><i class="fas fa-phone foot_img_space"></i><span>02-1234-5678</span></li>
                        <li><i class="fas fa-phone foot_img_space"></i><span>010-1234-5678</span></li>
                        <li><i class="fas fa-envelope foot_img_space"></i><span>abcdefg@gmail.com</span></li>
                    </ul>
                </div>
            </div>
        </div>
      <div id="copyright">
         <p id="copy_content">All Right Reserved © 2019-.06 Semi Project
            Travel to for Foreigner from Korea KH Web Design Company since 2019.
         </p>
         <div id="copy_img_div"> 
            <a href="javascript:void(0)" class="weatherbutton" style = "position : absoulte; top : 0px;">
               <span class="copy_img">
                  <i class="fas fa-cloud-sun"></i>
               </span>
            </a> 
            <jsp:include page="weather.jsp"></jsp:include> 
            <a href="javascript:void(0)" class="chat" style = "position : absoulte; top : 50px;">
               <span class="copy_img">
                  <i class="far fa-comments"></i>
               </span>
            </a>
             
            <jsp:include page="chatpage.jsp"></jsp:include> 
            <a href="#" id="top" style = "position : absoulte; top : 100px;">
               <span class="copy_img">
                  <i class="fas fa-arrow-up"></i>
               </span>
            </a>
         </div>
      </div>
   </div>
</body>
</html>