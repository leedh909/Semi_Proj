<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dto.GuideViewDto"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title> GRAPHCORE | 업체추천 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/hamburgers.min.css">
<link rel="stylesheet" href="assets/css/gijgo.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/animated-headline.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/logostyle.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.low_all {
	width: 100%;
}

.low_img {
	float: left;
	padding: 10px;
}

.low_detail {
	float: right;
	width: 650px;
	height: 350px;
	padding-top: 10px;
}
.major{
	background-color:transparent; border:0px transparent; color:black; padding-right:50px; padding-left:50px;
	cursor: pointer; text-align:center;
}
.minor{
	background-color:transparent; border:0px transparent; color:black; padding-right:50px; padding-left:50px;
	cursor: pointer; text-align:center;
}

.content {
	clear: both;
}

li {
	padding-bottom: 20px;
}

tr {
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	var defi = document.getElementById('hideOption1').value;
	if(defi == "1"){
		$("#data").show();
	}else{
		$("#data").hide();
	}
});

$(document).ready(function(){
	$(".major").hide();
	$(".minor").hide();
});


	function showCompany(num){
		if(num==1){
			$(".major").show();
			$(".minor").hide();
		}else if(num==2){
			$(".minor").show();
			$(".major").hide();
		}	
}

</script>

</head>
<body>
	<!-- ? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/gcB.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<!-- header end -->
	<main>
		<!--? Hero Start -->
		<div class="slider-area2" >
			<div class="slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap hero-cap2 pt-70 text-center">
								<h2>그럼 조립은 어디서 할까?</h2>
								<p>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div>
					<div class="title" align="center">
						<button style="background-color:transparent;  border:0px transparent;  padding-right:100px; cursor: pointer;" onclick="showCompany(1);">
							<h1 style="color:white; font-size:30px;">Major Company</h1>
						</button>
						<button style="background-color:transparent; border:0px transparent; color:white;  padding-left:100px; cursor: pointer;" onclick="showCompany(2)">
							<h1 style="color:white; font-size:30px;">Minor ComPany</h1>
						</button>
					</div>
				</div>
		</div>
		<br>
		<br>
		<!-- 사양별 태그 -->
		<section>
			<!-- Section Tittle -->
			<article id="title">
				<%
				String sp = request.getParameter("spec");
				String id = String.valueOf(session.getAttribute("login"));
				String no = request.getParameter("no");
				%>
				<div>
					<div class="title" style="text-align:center;" >
						<button  onclick="location.href='${pageContext.request.contextPath}/ViewController?command=mapfind&no=1'" class="major">
							<h1>COMPUZONE</h1>
						</button>
						<button  onclick="location.href='${pageContext.request.contextPath}/ViewController?command=mapfind&no=2'" class="major">
							<h1>COMSCLUB</h1>
						</button>
						<button  onclick="location.href='${pageContext.request.contextPath}/ViewController?command=mapfind&no=3'" class="minor">
							<h1>PC LIFE</h1>
						</button>
						<button style="background-color:transparent; border:0px transparent; color:black; text-align:center" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=mapfind&no=4'" class="minor">
							<h1>CACHE</h1>
						</button>
						<button  onclick="location.href='${pageContext.request.contextPath}/ViewController?command=mapfind&no=5'" class="minor">
							<h1>COMWOORI</h1>
						</button>
						<input type="hidden" id="hideOption1" value="${def}">
						
					</div>
				</div>
			</article>
		</section>
			<br>

	<section>
			<div class="container" id="data" style="padding-bottom:100px; padding-left:100px;">
				<h2  style="font-size:30px; ">Company Name:&nbsp;&nbsp;<input type="text" style="border:none; font-size:20px;" value="${dto.name}" readonly="readonly"> </h2>
				<br>
				<h2 style="font-size:30px;" >WebPage:&nbsp;&nbsp;<a style="font-size:25px; color:blue;"  href="${dto.webPage}" target="_blank">${dto.webPage}</a></h2>
				<br>
				<h2 style="font-size:30px;">Address:&nbsp;&nbsp;<input type="text" style="width:800px; border:none; font-size:20px;" value="${dto.addr}" readonly="readonly"></h2>
				<br>
								
				<div id="map" style="width:1000px;height:500px; padding-bottom:100px; "></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3609264200f57c874d43f14aa9416394&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${dto.mapAddr}', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.name}</div>'
				        });
				        infowindow.open(map, marker);
				        
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>			
				</div>
			</form>
			</div>
		</section>


	</main>
	
	
	<div class="content"></div>
	<div>
		<jsp:include page="footer.jsp" />
	</div>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->

	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="./assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="./assets/js/jquery.counterup.min.js"></script>
	<script src="./assets/js/waypoints.min.js"></script>
	<script src="./assets/js/jquery.countdown.min.js"></script>
	<script src="./assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="./assets/js/contact.js"></script>
	<script src="./assets/js/jquery.form.js"></script>
	<script src="./assets/js/jquery.validate.min.js"></script>
	<script src="./assets/js/mail-script.js"></script>
	<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>
	
</script>
</body>
</html>>