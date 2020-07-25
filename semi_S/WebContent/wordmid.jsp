<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<title> GRAPHCORE | 중급 </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
	<link rel="stylesheet" href="assets/css/posts.css" />
	<link rel="stylesheet" href="assets/css/logostyle.css">
	<link rel="stylesheet" href="assets/css/btn.css">
</head>
<body>
    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
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
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70 text-center">
                                <h2>컴퓨터 중급 용어</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
       <div class="posts">
		<article>
			<div class="embed-container" ><iframe style="max-width: 100%;" width="520" height="381.53" src="https://www.youtube.com/embed/5-l4nLA2vZU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div><br>
			<h2><b>오버클럭</b></h2>
			<p>100%의 성능을 200%까지 끌어올리는 기술이며 부품이 고장나는 경우도 있기 때문에 필수로 해야하는 과정은 아닙니다.<br>Z가 붙은 메인보드, K가 붙은 CPU, XMP지원이 되는 램이 있어야 가능함</p>
			

		</article>
		<article>
			<div class="embed-container"><iframe style="max-width: 100%;" width="520" height="381.53" src="https://www.youtube.com/embed/S226rfhPSrc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div><br>
			<h2><b>언더클럭</b></h2>
			<p>오버클럭의 반댓말으로 클럭과 전압을 동시에 낮춰서 최대한 저소음 및 배터리 시간을 극한으로 늘리는 기술입니다. 그러나 지나친 언더클럭은 오히려 장치에 해가 되기 때문에 자주 시도하는 것은 좋지 않습니다.

</p>
		</article>
		<article>
			<div class="embed-container"><iframe style="max-width: 100%;" width="520" height="381.53" src="https://www.youtube.com/embed/mhBiUvMHxT4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div><br>
			<h2><b>컴퓨터 조립법</b></h2>
			<p>조립 컴퓨터에서 가장 중요한 과정입니다. 전문가의 도움을 맡기는 것이 좋지만 직접 조립하고 싶으신 분들은 해당 영상을 참고해 주세요.
</p>
			
		</article>
		<article>
			<div class="embed-container"><iframe style="max-width: 100%;" width="520" height="381.53" src="https://www.youtube.com/embed/dV7aL2ui5zE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div><br>
			<h2><b>윈도우 설치 및 포맷</b></h2>
			<p>포맷 전 중요파일은 백업합니다.<br>운영체제에 따라 방법이 다르니 맞는 영상을 참고해 주세요.</p>
			
		</article>
		
		
		
	</div>
	
	<div class="button-4" style="top: -90px; float:right; left: -100px;" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=wordcho'">
    <div class="eff-4"></div>
    <div class="no-drag">
    <a href="#"> 초급 ▶ </a>
			  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
  </div></div>
    </main>
    <div> 
		<jsp:include page="footer.jsp" />
	</div>
    <!-- Scroll Up -->
    <div id="back-top" >
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
    
    </body>
</html>