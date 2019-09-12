<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>For Foreginer</title>

<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/reviewtomain.js?ver=1"></script>

</head>

<body>
	<!-- ============================================= HEADER  =================================================== -->
	<!-- ============================================= HEADER  =================================================== -->
	<!-- ============================================= HEADER  =================================================== -->
	<jsp:include page="pageheader.jsp"></jsp:include>

	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<!-- ============================================= B O D Y =================================================== -->
	<div id="body">
		<div id="reco_place_div">
			<div id="reco_place">
				<div id="introduce">
					<h2>Recommend Destination</h2>
					<p>
						This is a list of travel destinations recommended by our site.<br>
						I want you to experience Korean culture.
					</p>
				</div>
				<div id="reco_place_info">
					<div class="reco_img">
						<div>
							<a href="#">
								<figure class="img_border">
									<img src="etc/image/img/img_2.jpg" alt="Seoul">
									<i class="fas fa-plus"></i>
								</figure>
								<div class="explan">
									<h2>Seoul, South Korea</h2>
									<p>It is a tranditional Korean structure building with a
										long history.</p>
									<p class="more_btn">Learn more</p>
								</div>
							</a>
						</div>
					</div>
					<div class="reco_img">
						<div>
							<a href="#">
								<figure class="img_border">
									<img src="etc/image/img/img_2.jpg" alt="Seoul">
									<i class="fas fa-plus"></i>
								</figure>
								<div class="explan">
									<h2>Seoul, South Korea</h2>
									<p>It is a tranditional Korean structure building with a long history.</p>
									<p class="more_btn">Learn more</p>
								</div>
							</a>
						</div>
					</div>
					<div class="reco_img">
						<div>
							<a href="#">
								<figure class="img_border">
									<img src="etc/image/img/img_2.jpg" alt="Seoul">
									<i class="fas fa-plus"></i>
								</figure>
								<div class="explan">
									<h2>Seoul, South Korea</h2>
									<p>It is a tranditional Korean structure building with a long history.</p>
									<p class="more_btn">Learn more</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="reviews_div">
			<div id="introduce">
				<h2>Review Board</h2>
				<p>
					This section is review board.<br> Please share your review
					with others from your experience.
				</p>
			</div>
			<div id="review_detail">
				<div class="review_img" id="review_data1">
					<div>
						<a href="#" id="go_review_detail1">
							<figure class="img_border1">
								<!-- <img id = "review_img1" src="etc/image/img/img_2.jpg" alt="review"> -->
								<i class="fas fa-plus"></i>
							</figure>
							<div class="explan">
								<h2 id="review_title1">TITLE</h2>
								<p>This section is a content. Please your enter content.</p>
								<p class="more_btn">Learn more</p>
							</div>
						</a>
					</div>
				</div>
				<div class="review_img" id="review_data2">
					<div>
						<a href="javascript:void(0)" id="go_review_detail2">
							<figure class="img_border2">
								<!-- <img src="etc/image/img/img_2.jpg" alt="review"> -->
								<i class="fas fa-plus"></i>
							</figure>
							<div class="explan">
								<h2 id="review_title2">TITLE</h2>
								<p>This section is a content. Please your enter content.</p>
								<p class="more_btn">Learn more</p>
							</div>
						</a>
					</div>
				</div>
				<div class="review_img" id="review_data3">
					<div>
						<a href="#" id="go_review_detail3">
							<figure class="img_border3">
								<!-- <img src="etc/image/img/img_2.jpg" alt="review"> -->
								<i class="fas fa-plus"></i>
							</figure>
							<div class="explan">
								<h2 id="review_title3">TITLE</h2>
								<p>This section is a content. Please your enter content.</p>
								<p class="more_btn">Learn more</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<!-- ============================== F O O T E R ======================================== -->
	<jsp:include page="pagefooter.jsp"></jsp:include>
</body>
</html>