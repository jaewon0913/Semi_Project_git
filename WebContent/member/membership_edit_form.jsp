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
	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css">
	<script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js"></script>
	
	<style type="text/css">
    #table_{
	margin: 5%;
	position: center
}

#table_my{
	border-collapse: collapse;
	border: 2px solid #ccc;
	
}

#th_my{
	background-color: #EAEAEA;
	width :144.67px;
	height:86px;
	font-family: HanSans;;
	color:#333333;
	font-size:15px;
 	font-style: italic; 
	
	
}

#td_my{
	width: 393.33px;
}

#text{
	padding: 6px 12px;
    width: 250px;
    height: 100%;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    resize: none;
    font-size: 14px;
}

td{
	text-align: center;
}

#cancle_btn{
/* data-text-content="true" ; */
	position:relative;
	font-size: 16px; 
	color: rgb(64, 64, 64); 
	text-align: center; 
	line-height: 2.9em; 
	border-radius: 4px; 
	background-color: rgb(224, 224, 224);
	top: 700px;
	width: 130px;
	height: 50px;
	left: -40px;
}

#edit_btn{
	position:relative;
	font-size: 16px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.9em;
    border-radius: 4px;
    background-color: rgb(94, 94, 94);
	top: 700px;
	width: 130px;
	height: 50px;
	right: -40px;
}
    
    
	</style>
	
	<script type="text/javascript">

    $(function () {
        var extra_login_width = $(document).width();
        var extra_login_height = $(document).height();

        $(".dropdown li").mouseover(function () {
            $(this).children(".dropdown_menu").stop().slideDown();
        })

        $(".dropdown li").mouseleave(function () {
            $(this).children(".dropdown_menu").stop().slideUp();
        })

        $("#login_btn_main").click(function () {
            $("#layer_popup").css('display', 'block');
            $("#extra_login").css({ 'width': extra_login_width, 'height': extra_login_height, 'display': 'block', 'background-size': 'cover' })
        })

        $("#extra_login, #layer_popup").on('scroll touchmove mousewheel', function (event) {
            document.getElementsByTagName('body')[0].style.overflow = 'hidden';
            $("#extra_login").css({ 'width': '100%', 'height': extra_login_height, 'display': 'block', 'background-size': 'cover' })
            event.preventDefault();
            event.stopPropagation();

            return false;
        })

        $(".close, #extra_login").click(function () {
            $("#extra_login, #layer_popup").hide()
            $("input[type=text], input[type=password]").val('')
            document.getElementsByTagName('body')[0].style.overflow = ''
        })

        $("#login_btn").click(function () {
            // if(아이디와 비밀번호가 맞을시) { 
            $("#extra_login, #layer_popup").hide()
            // }
            document.getElementsByTagName('body')[0].style.overflow = ''
        })

        $("#top").click(function(){
            $("html, body").animate({
                scrollTop: '0'
            }, 800)
        })
        
    })
            $(document).ready(function(){
                $('.bxslider').bxSlider({
                    auto: true, // 자동으로 애니메이션 시작
                    peed: 500,  // 애니메이션 속도
                    ause: 2500,  // 애니메이션 유지 시간 (1000은 1초)
                    ode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
                    utoControls: true, // 시작 및 중지버튼 보여짐
                    ager: true, // 페이지 표시 보여짐
                    aptions: true, // 이미지 위에 텍스트를 넣을 수 있음
                })
            })

	</script>
</head>
<body>
<jsp:include page="../pageheader.jsp"></jsp:include>
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
    <!-- ============================================= B O D Y =================================================== -->
<div data-obj-id="fVC4z" data-obj-type="element"
		data-text-editable="true" class="ui-selectee"
		style="position: absolute; top: 780px; left: 760px; width: 183px; height: 61px;">
		<div data-text-content="true"
			style="font-size: 30px; line-height: 1.9em; text-align: center; font-weight: normal; font-style: italic;"
			class="" spellcheck="false" >my-info</div>
	</div>
			<div id="table_" align = "center">
			
			
			
			<form action="member.do" method="post">
				<input type="hidden" name="command" value="edit" />

				<table  id="table_my" border="1">
					<col width="100" />
					<col width="100" />
					<col width="100" />
					<col width="100" />
					<col width="100" />
					<col width="100" />

					<tr>
						<th id="th_my">Id</th>
						<td id="td_my">${id.member_id }<input type="hidden" name="id"
							value="${id.member_id}"></td>
					</tr>
					<tr>
						<th id="th_my">Name</th>
						<td>${id.member_name }<input type="hidden" name="name"
							value="${id.member_name}" id="text"/></td>

					</tr>
					<tr>
						<th id="th_my">PassWord</th>
						<td rowspan="1"><input type="password" name="pw" id="text"  placeholder="비밀번호를 입력해 주세요"/>
						<input type="password" name="pw_ch" id="text" placeholder="비밀번호를  한번 더 입력해 주세요"/></td>

					</tr>
					<tr>
						<th id="th_my">Date of birth</th>
						<td>${id.member_birth }<input type="hidden" name="birth"
							value="${id.member_birth }" id="text"/></td>

					</tr>
					<tr>
						<th id="th_my">Email</th>
						<td><input type="text" name="email" value="${id.member_email }" id="text"/>
					</tr>

					<tr>
						<th id="th_my">Gender</th>
						<td>
						<c:if test="${id.member_gender eq 'M' }">
							<input type="radio" name="gender" value="M" checked="checked" />M
							<input type="radio" name="gender" value="F" disabled="disabled" />F
						</c:if>
						<c:if test="${id.member_gender ne 'M' }">
							<input type="radio" name="gender" value="M" disabled="disabled"/>M
	 						<input type="radio" name="gender" value="F" checked="checked"/>F
						</c:if>
						<c:if test=""></c:if>
						</td>
					</tr>
					<tr>
					
<!-- 						<th colspan="2" align="center"> -->
						<input type="button" value="cancle" onclick="location.href='mypage.jsp'" id="cancle_btn"> <!-- 취소 누르면 마이페이지 홈으로 고우 -->
							<input type="submit" value="edit" id="edit_btn"></th>
					</tr>




				</table>
			</form>
		</div>
	<!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <!-- ============================== F O O T E R ======================================== -->
    <jsp:include page="../pagefooter.jsp"></jsp:include>
</body>
</html>