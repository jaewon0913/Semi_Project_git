<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>

	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
	<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
	<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>
	
<style>

    ul{padding: 0px;}
    
    li{list-style: none; padding: 0px;}


    #korea_select{
        position: relative;
        width: 50vw;
        z-index: 1;
        margin: auto;
    }

    .province{
        position: relative;
        left: 20px;
        z-index: 1;
    }

    #pro1{
        position: absolute;
        width: auto;
        top: 68px;
        left: 78px;
        font-size: 16px;
        opacity: 0.8;
        z-index: 2;
    }
    
    #pro2{
    	position: absolute;
        width: auto;
        top: 138px;
        left: 58px;
        font-size: 16px;
        opacity: 0.8;
        z-index: 4;
    }
    
    #pro3{
    	position: absolute;
        width: auto;
        top: 156px;
        left: 111px;
        font-size: 16px;
        opacity: 0.8;
        z-index: 3;
    }
    
    #pro4{
    	position: absolute;
        width: auto;
        top: 229px;
        left: 23px;
        font-size: 16px;
        opacity: 0.8;
    }
    
    #pro5{
    	position: absolute;
        width: auto;
        top: 22px;
        left: 159px;
        font-size: 16px;
        opacity: 0.8;
    }
    
    #pro6{
    	position: absolute;
        width: auto;
        top: 402px;
        left: 34px;
        font-size: 16px;
        opacity: 0.8;
    }
    
    #pro7{
    	position: absolute;
        width: auto;
        top: 152px;
        left: 211px;
        font-size: 16px;
        opacity: 0.8;
    }
    
    #pro8{
    	position: absolute;
        width: auto;
        top: 749px;
        left: 51px;
        font-size: 16px;
        opacity: 0.8;
    }

    .province a,
    .province a:hover,
    .province a:active {
        text-decoration: none;
        Color: #2E2E2E;
    }

	#north{
		z-index: -1;
	}

    .pro_img{
        opacity: 0;
    }

    .province:hover img{
        display: inline-block;
        opacity: 1.0;
    }
    
    @media(max-width: 480px) {
        #nav_div{
            display: none;
        }

        #mobile_menu{
            display: block;
            z-index: 2;
        }
    }

</style>

<body>
	<!-- header -->
	<jsp:include page="../pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <div id="korea_select">
       <img src="${pageContext.request.contextPath }/etc/image/koreaimg/korea_map.png" alt="maps" id="north">
          <div>
             <span id="pro1" class="province"><a href="map.do?command=province_detail&province_name=seoul"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/GyeonGi.png" alt="GyeonGi" class="pro_img"></a></span>
             <span id="pro2" class="province"><a href="map.do?command=province_detail&province_name=incheon"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/InCheon.png" alt="InCheon" class="pro_img"></a></span>
             <span id="pro3" class="province"><a href="map.do?command=province_detail&province_name=gyeonggi"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/Seoul.png" alt="Seoul" class="pro_img"></a></span>
             <span id="pro4" class="province"><a href="map.do?command=province_detail&province_name=chungcheong"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/ChungCheong.png" alt="ChungCheong" class="pro_img"></a></span>
             <span id="pro5" class="province"><a href="map.do?command=province_detail&province_name=gangwon"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/GangWon.png" alt="GangWon" class="pro_img"></a></span>
             <span id="pro6" class="province"><a href="map.do?command=province_detail&province_name=jeonla"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/JeonLa.png" alt="JeonLa" class="pro_img"></a></span>
             <span id="pro7" class="province"><a href="map.do?command=province_detail&province_name=gyeongsang"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/GyeonSang.png" alt="GyeonSang" class="pro_img"></a></span>
             <span id="pro8" class="province"><a href="map.do?command=province_detail&province_name=jeju"><img src="${pageContext.request.contextPath }/etc/image/koreaimg/jeju.png" alt="JeJu" class="pro_img"></a></span>
          </div>
    </div>
	<!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html> 