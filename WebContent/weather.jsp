<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "${pageContext.request.contextPath }/js/finedust.js?ver=1"></script>

<style type="text/css">
.k_map .map {
    position: relative;
    right : 300px;
    width: 268px;
    height: 306px;
    background: url(https://ssl.pstatic.net/static/weather/images/map_sub.gif) no-repeat 0 0;
    vertical-align : top
}
.k_table .q_table{
	postion : relative;
	width : 200px;
	right : 300px;
}
.q_table{
	height : 0px;
}
.zone {
    position: absolute;
    width: 50px;
    height: 37px;
    z-index: 10;
    text-align: center;
    cursor: pointer;
    cursor: hand;
    font-size : 8pt;
    text-decoration : none;
}
.k_map .z1 {
    left: 54px;
    top: 65px;
}
.k_map .z2 {
    left: 5px;
    top: 71px;
}
.k_map .z3 {
    left: 106px;
    top: 46px;
}
.k_map .z4 {
    left: 152px;
    top: 58px;
}
.k_map .z5 {
    left: 97px;
    top: 115px;
}
.k_map .z6 {
    left: 43px;
    top: 125px;
}
.k_map .z7 {
    left: 150px;
    top: 121px;
}
.k_map .z8 {
    left: 142px;
    top: 195px;
}
.k_map .z9 {
    left: 215px;
    top: 49px;
}
.k_map .z10 {
    left: 90px;
    top: 172px;
}
.k_map .z11 {
    left: 43px;
    top: 202px;
}
.k_map .z12 {
    left: 25px;
    top: 260px;
}
#closebutton{
	position : relative;
	bottom : 47px;
}
.finedust_table{
	position : relative;
	bottom : 78px;
	right : 130px;
}
</style>

</head>
<body>
	<script type="text/javascript">
		$(function() {
			$(".weatherbutton").click(function() {
				$(".k_map").css("display", "block");
				$("#chatbox").css("display", "none");

				var url = "etc.do?command=weather";
				
				$.ajax({
					type : "GET",
					url : url,
					dataType : "text",
					success : function(data){
						var tmp = $.trim(data);
						var obj = JSON.parse(tmp);
						
						$.each(obj, function(key,val){
							if(key == "DATA"){
								var list = val;
								for(var i = 0 ; i<list.length; i++){
									$("#weather"+i).empty();
								}
								for(var i = 0 ; i<list.length; i++){
									var str = list[i];
									$("#weather"+i).append(str.wf + str.tmx + "/" + str.tmn);
								}
							}
						});
					},
					error : function(){
						alert("날씨정보 불러오는데 실패!");
					}
				});
			})
		});
	function closeweather(){
		$(".k_map").css("display", "none");
		$(".k_table").css("display", "none");
	}
	</script>

	
	<div class = "k_map" style = "display : none; height : 44px; vertical-align : right">
		<div class = "map" id = "weatherMap">
			<input id = "closebutton" type = "button" value = "X" onclick = "closeweather()" />
			<a href="javascript:void(0)" id="weather0" class="zone z1" onclick="finedust('서울')"></a>	<!-- 서울 -->
			<a href="javascript:void(0)" id="weather1" class="zone z2" onclick="finedust('인천')"></a><!-- 서해 -->
			<a href="javascript:void(0)" id="weather2" class="zone z3" onclick="finedust('경기')"></a><!-- 영서 -->
			<a href="javascript:void(0)" id="weather3" class="zone z4" onclick="finedust('경기')"></a><!-- 영동 -->
			<a href="javascript:void(0)" id="weather4" class="zone z5" onclick="finedust('충북')"></a><!-- 충북 -->
			<a href="javascript:void(0)" id="weather5" class="zone z6" onclick="finedust('충남')"></a><!-- 충남 -->
			<a href="javascript:void(0)" id="weather6" class="zone z7" onclick="finedust('경북')"></a><!-- 경북 -->
			<a href="javascript:void(0)" id="weather7" class="zone z8" onclick="finedust('부산')"></a><!-- 경남 -->
			<a href="javascript:void(0)" id="weather8" class="zone z9" onclick="finedust('강원')"></a><!-- 울릉도 -->
			<a href="javascript:void(0)" id="weather9" class="zone z10" onclick="finedust('전북')"></a><!-- 전북 -->
			<a href="javascript:void(0)" id="weather10" class="zone z11" onclick="finedust('전남')"></a><!-- 전남 -->
			<a href="javascript:void(0)" id="weather11" class="zone z12" onclick="finedust('제주')"></a><!-- 제주도 -->
		</div>
	</div>
	
	<div class = "k_table">
		<div class = "q_table">
			<table class = "finedust_table">
				<thead></thead>
				<tbody></tbody>
			</table>
		</div>
	</div>


</body>
</html>