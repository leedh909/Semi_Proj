<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<title> Architects | Template </title>
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
	<link rel="stylesheet" href="assets/css/logostyle.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style type="text/css">
		.low_all{
			width: 100%;
		}
		.low_img{
			float:left;
			
			padding: 10px;
		
		}
		.low_detail{
			float:right;
			width:650px;
			height:350px;
			padding-top: 10px;
		
		}
		.content{
			clear: both;
		}
		li{
			padding-bottom: 20px;
		}
	
	</style>
	<script type="text/javascript">
	$(function(){
		$("#choose1").hide();
		$("#choose2").hide();
		$("#choose3").hide();
	});
	function choose(num){
		
		if(num==1){
			$("#choose1").show();
			$("#choose2").hide();
			$("#choose3").hide();
		}else if(num==2){
			$("#choose1").hide();
			$("#choose2").show();
			$("#choose3").hide();
		}else if(num==3){
			$("#choose1").hide();
			$("#choose2").hide();
			$("#choose3").show();
		}
		
	}
	
	</script>
</head>
<body>
	<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.png" alt="">
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
                            <h2>PC 추천 - 저사양</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="title" align="center">
			<button onclick="choose(1);"><h1>CHOOSE - 1</h1></button>
			<button onclick="choose(2);"><h1>CHOOSE - 2</h1></button>
			<button onclick="choose(3);"><h1>CHOOSE - 3</h1></button>
		</div>
    </div>
   <br><br>
   <!-- 사양별 태그 -->
   <section>   
   	 <!-- Section Tittle -->
   	 <article id="title" align="center">
   	  <div>
          <div class="title" align="center">
			<button onclick="choose(1);"><h1>CHOOSE - 1</h1></button>
			<button onclick="choose(2);"><h1>CHOOSE - 2</h1></button>
			<button onclick="choose(3);"><h1>CHOOSE - 3</h1></button>
		  </div>
      </div>
   	 </article>
   	<br>
	<div class="container" id="choose1">
   	   <div class="low_all">
       	<p class="low_img">
       		 <img src="assets/img/gallery/popular1.png" alt="" width="500px;" height="500px;">
       	</p>
       	<div class="low_detail">
       	<sction>
         <div style="padding-left:100px;">
          <div class="single_sidebar_widget post_category_widget" style="width:600px; float:left;">
            <ul class="list cat-list">
               <li>
                  <a href="#" class="d-flex">
                     <p>CPU</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
                  
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>메인보드</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>그래픽</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ssd</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ram</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>코로나</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
            </ul>
          </div>
         </div>
        </sction>
       	</div>
       </div>
     </div>
     <div class="container" id="choose2">
   	   <div>
       	<p class="low_img">
       		 <img src="assets/img/gallery/popular2.png" alt="" width="500px;" height="500px;">
       	</p>
       	<div class="low_detail">
       	<sction>
         <div style="padding-left:100px;">
          <div class="single_sidebar_widget post_category_widget" style="width:600px; float:left;">
            <ul class="list cat-list">
               <li>
                  <a href="#" class="d-flex">
                     <p>CPU</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
                  
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>메인보드</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>그래픽</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ssd</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ram</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>코로나</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
            </ul>
          </div>
         </div>
        </sction>
       	</div>
       </div>
     </div>
     <div class="container" id="choose3">
   	   <div>
       	<p class="low_img">
       		 <img src="assets/img/gallery/popular3.png" alt="" width="500px;" height="500px;">
       	</p>
       	<div class="low_detail">
       	<sction>
         <div style="padding-left:100px;">
          <div class="single_sidebar_widget post_category_widget" style="width:600px; float:left;">
            <ul class="list cat-list">
               <li>
                  <a href="#" class="d-flex">
                     <p>CPU</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
                  
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>메인보드</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>그래픽</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ssd</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>ram</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
               <li>
                  <a href="#" class="d-flex">
                     <p>코로나</p>
                     <p>(10)</p>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" value="안녕하세요하하하하">
                  </a>
               </li>
            </ul>
          </div>
         </div>
        </sction>
       	</div>
       </div>
     </div>
     <div class="content"></div>
  	</section>
  	<sction class="content">
        
    <sction>
    </main>
    <div class="content"></div>
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