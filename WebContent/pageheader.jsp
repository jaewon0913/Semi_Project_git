<%@page import="com.semi.member.dto.memberdto"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
<title>For Foreigner</title>

</head>
<body>

   <%
      memberdto id = (memberdto) request.getSession().getAttribute("id");
      String url = request.getRequestURL().toString();
      String url2 = request.getSession().getServletContext().getRealPath("/");
      String context = request.getContextPath();
   %>
  <%--  <%=url%>
   <hr/>
   <%=url2 %>
   <hr/>
   <%=context %>
   <hr/>
   Path : <%= request.getServletPath() %>
   <hr/>
   URI : <%= request.getRequestURI() %> --%>

   <nav id="nav">
   <div>
            <div id="mobile_account" >
               <c:choose>
               <c:when test="${empty id}">
                  <span id="mobile_login" ><i class="fas fa-sign-in-alt"></i></span>
                     <span id="mobile_signup"><i class="fas fa-user-plus"></i></span>
               </c:when>
               <c:otherwise>
                     <span id="mobile_logout"><i class="fas fa-sign-out-alt"></i></span>
                         <span id="mobile_profile"><i class="fas fa-user"></i></span>
                  </c:otherwise>
               </c:choose>
            </div>
            <div id="mobile_bar">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
            <div id="mobile_menu">
                    <div id="foot_info">
                            <div class="center">
                                <div class="footer_ele foot_select foot_dropdown">
                                    <h3>
                                        Travel spot 
                                    </h3>
                                    <i class="fas fa-plus mobile_plus" ></i>
                                    <i class="fas fa-minus mobile_minus" ></i>
                                    <ul class="foot_dropdown_menu">
                                        <li onclick="location.href='${pageContext.request.contextPath }/festival.do?command=monthfestival'"><span>Festival</li>
                                        <li><a href="review.do?command=reservation"><span>Reservation</span></a></li>
                                    </ul>
                                </div>
                                <div class="footer_ele foot_dropdown">
                                    <h3>Map</h3>
                                    <a href="${pageContext.request.contextPath }/map.do?command=planning"><i class="fas fa-chevron-right mobile_right"></i></a>
                                </div>
                            </div>
                            <div class="center">
                                <div class="footer_ele foot_dropdown">
                                    <h3>Reservation</h3>
                                    <i class="fas fa-plus mobile_plus" ></i>
                                    <i class="fas fa-minus mobile_minus" ></i>
                                    <ul class="foot_dropdown_menu">
                                        <li><a href="${pageContext.request.contextPath }/festival.do?command=monthfestival"><span>Tour</span></a></li>
                                        <li><a href="${pageContext.request.contextPath }/review.do?command=reservation"><span>Accommodation</span></a></li>
                                    </ul>
                                </div>
                                <div class="footer_ele foot_select foot_dropdown">
                                    <h3>Board</h3>
                                    <i class="fas fa-plus mobile_plus" ></i>
                                    <i class="fas fa-minus mobile_minus" ></i>
                                    <ul class="foot_dropdown_menu">
                                        <li onclick="location.href='${pageContext.request.contextPath }/board.do?command=noticeboardform'"><span>Notice</span></li>
                                        <li onclick="location.href='${pageContext.request.contextPath }/board.do?command=freeboardform'"><span>Free Board</span></li>
                                    </ul>
                                </div>
                                <div class="footer_ele foot_select foot_dropdown" onclick="location.href='${pageContext.request.contextPath }/review.do?command=reviewboard&pagenum=1&contentnum=10'">
                                    <h3>Reviews</h3>
                                    <i class="fas fa-chevron-right mobile_right"></i>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
      <div id="nav_div">
         <div id="nav_logo">
            <a
               href="${pageContext.request.contextPath }/member.do?command=mainhome"><img
               src="${pageContext.request.contextPath }/etc/image/TFK_LOGO/2-3.png"
               alt="Logo" width="40%"></a>
         </div>
         <div id="nav_menu_div">
            <ul id="nav_menu_ul" class="alignment_right">
               <a href="#" class="dropdown">
                  <li class="nav_menu white">Travel Spot <span><i
                        class="fas fa-angle-down"></i></span>
                     <ul class="dropdown_menu">
                        <li class="dropdown_ele"
                           onclick="location.href='${pageContext.request.contextPath }/festival.do?command=monthfestival'">Festival</li>
						<li class="dropdown_ele" 
						onclick="location.href='${pageContext.request.contextPath }/destination.do?command=des_list'">Destination</li>                     </ul>
               </li>
               </a>
               <a href="${pageContext.request.contextPath }/map.do?command=planning">
                  <li class="nav_menu white">Map</li>
               </a>
               <a href="#" class="dropdown">
                  <li class="nav_menu white">Reservation&nbsp; <span><i
                        class="fas fa-angle-down"></i></span>
                     <ul class="dropdown_menu">
                        <li class="dropdown_ele"
                           onclick="location.href='${pageContext.request.contextPath }/tour.do?command=product'">Tour</li>
                        <li class="dropdown_ele"
                           onclick="location.href='${pageContext.request.contextPath }/board.do?command=accommodationform'">Accommodation</li>
                     </ul>
               </li>
               </a>
               <a href="#" class="dropdown">
                  <li class="nav_menu white">Board&nbsp; <span><i
                        class="fas fa-angle-down"></i></span>
                     <ul class="dropdown_menu">
                        <li class="dropdown_ele"
                           onclick="location.href='${pageContext.request.contextPath }/board.do?command=noticeboardform'">Notice</li>
                        <li class="dropdown_ele"
                           onclick="location.href='${pageContext.request.contextPath }/board.do?command=freeboardform'">Free
                           Board</li>
                     </ul>
               </li>
               </a>
               <a href="${pageContext.request.contextPath }/review.do?command=reviewboard&pagenum=1&contentnum=10">
                  <li class="nav_menu white">Reviews</li>
               </a>
            </ul>
         </div>
      </div>
   </nav>
   <div id="header">
      <div id="extra"></div>
      <div id="summary">
         <div id="summary_info" class="alignment_right white"
            style="color: #ffffff">
            <div style="color: #ffffff; background: none; z-index: 5">
               <h1>Travel to Foreigner from Korea</h1>
               <p id="summary_info_text" class="alignment_right white">This is
                  traveled information site for foreigners to korea</p>
            </div>
            <div id="member">
               <c:choose>
                  <c:when test="${empty id.member_id }">
                     <span class="white button_size_padding interval"></span>
                     <a href="javascript:void(0);" id="login_btn_main"
                        class="border_radius_10 white button_size_padding inteval"><span>Login</span></a>
                     <a
                        href="${pageContext.request.contextPath }/member.do?command=normalregistform"
                        class="border_radius_10 white button_size_padding interval"><span>Sign
                           Up</span></a>
                  </c:when>
                  <c:otherwise>
                     <span class="white button_size_padding interval">${id.member_id }님 </span>
                     <a
                        href="${pageContext.request.contextPath }/member.do?command=logout"
                        id="login_btn_main"
                        class="border_radius_10 white button_size_padding inteval"><span>LogOut</span></a>
                     <a
                        href="${pageContext.request.contextPath }/member.do?command=mypageform"
                        class="border_radius_10 white button_size_padding interval"><span>My
                           Page</span></a>
                  </c:otherwise>
               </c:choose>
         </div>
      </div>

      <div id="extra_login"></div>
      <div id="layer_popup">
         <form action="member.do" method="post">
            <input type="hidden" name="command" value="login" />
            <input type="hidden" name="url" value ="<%=url %>" >
            <a href="#" class="close">
                  <span><i class="fas fa-times"></i></span>
            </a>
            <h1>LOGIN</h1>
            <div>
               <p>
                  <label for="">Username</label> <input type="text"
                     placeholder="Username" name="id" required>
               </p>
               <p>
                  <label for="password">Password</label> <input type="password"
                     placeholder="Password" name="pw" required>
               </p>
               <p>
                  <label for="remember"><input type="checkbox"
                     name="remember">ID Remember</label>
               </p>
               <input type="submit" id="login_btn" value="LOGIN" />
               <script async defer crossorigin="anonymous"
                  src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.3&appId=452413625522628&autoLogAppEvents=1"></script>
               <div class="fb-login-button" data-width="500" data-size="large"
                  data-button-type="login_with" data-auto-logout-link="true"
                  data-use-continue-as="false" scope="public_profile,email"
                  onlogin="checkLoginState();"></div>
            </div>
            <br />
            <div id="account_info">
               <span><a href="member.do?command=findid">Forgot Id?</a>&nbsp;|&nbsp;<a
                  href="member.do?command=findpw">Forgot Pw?</a>&nbsp;|&nbsp;<a
                  href="member.do?command=normalregistform">Sign Up</a></span>
            </div>
         </form>
      </div>
   </div>
   </div>
</body>
</html>