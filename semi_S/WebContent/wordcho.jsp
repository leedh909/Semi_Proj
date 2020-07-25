<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<title> GRAPHCORE | 초급 </title>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
	<style type="text/css">
		.clear{
			clear: both;
		}
	</style>
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
                                <h2>컴퓨터 초급 용어</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <!-- Hero End -->
        <!-- Hero End -->
       <div class="posts">
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -CPU.jpg" alt="" /></a>
			<h2><b>CPU</b></h2>
				<details>
					<summary><i>모든 작동 연산을 담당하는 핵심 두뇌</i></summary>
					<p>사람으로 치면 두뇌에 해당하고 컴퓨터의 전반적인 성능을 좌우하는 가장 중요한 부품입니다.<br>
코어: CPU의 중심, 코어가 2개면 듀얼코어, 4개면 쿼드코어, 6개면 헥사 코어, 8개면 옥타코어<br>
클럭: CPU가 일처리를 얼마나 빠르게 처리 하는지 GHz로 표시하는 것. 숫자가 클 수록 동작을 빠르게 처리합니다.<br>
스레드: 보통 코어 개수와 동일하며 개수가 많을 수록 작업을 동시에 처리할 수 있습니다.<br><br>추천브랜드<br>
<b>AMD, Intel</b></p>
				</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -메인.jpg" alt="" /></a>
			<h2><b>메인보드</b></h2>
				<details>
					<summary><i>각 하드웨어를 하나로 연결하는 기판</i></summary>
					<p>CPU,GPU,HDD,RAM등 내부 구성요소들이 유기적으로 연결될 수 있는 고리 역할을 담당합니다.
쓸만한 제품은 가격도 비싸고 고장 시 교체도 가장 까다롭기 때문에 보통 품질이 보증되지 않은 5만원 이하 저가 모델은피하는 것이 좋습니다.<br><br>추천모델<br><b>AUS, GIGABYTE, MSI</b></p>
				</details>
			</ul>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -RAM.jpg" alt="" /></a>
			<h2><b>메모리(RAM)</b></h2>
				<details>
					<summary><i>프로그램 구동에 필요한 자원</i></summary>
					<p>HDD나 SSD에 저장된 자료를 구동할 때 필요한 여유 자원을 제공합니다.
흔히 '다다익램'이라 하여 램 용량은 크면 클수록 좋다고 하는데요. 어느 정도 맞는 말이긴 하지만
그래도 자신의 사용 범위에 꼭 필요한 수준만 구입하는 게 역시 현명한 소비자의 모습이겠지요?<br><br>적정범위<br>▶ <b>사무용</b>: 4-8GB, <b>게임용</b>: 16GB <b>영상용</b>: 16GB*2</p>
				</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -SSD.jpg" alt="" /></a>
			<h2><b>HDD & SSD</b></h2>
			<details>
					<summary><i>싸고 고용량 or 비싸지만 고속</i></summary>
					<p>HDD는 저렴하고 용량이 큰 장점과 소음이 있다는 단점을 가지고 있고 SSD는 가격이 꽤 나가지만 빠르고 소음이 적다는 장점을 가지고 있습니다.
보통의 가정집에선 HDD를 달고 게임용은 SSD를 추가적으로 달고 있습니다.<br><br>추천모델<br><b>삼성전자 860 EVO</b></p>
				</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -GPU.jpg" alt="" /></a>
			<h2><b>그래픽카드</b></h2>
			<details>
				<summary><i>고성능 게임, 그래픽 작업에 필수</i></summary>
				<p>보통 그래픽카드와 명칭을 혼용하는 GPU는 사실 필수 하드웨어가 아닙니다. 요즘 CPU는 자체 GPU를 내장하고 있어 고사양 게임, 그래픽 작업용 PC가 아니라면 별도의 GPU는 불필요하기 때문인데요. 게임이나 고급 작업을 위한 사용자는 추가로 달아주면 됩니다.</p>
				<br><br>추천브랜드<br><b>GTX1660 SUPER</b></p>
			</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -POWER.jpg" alt="" /></a>
			<h2><b>파워</b></h2>
			<details>
					<summary><i>모든 하드웨어 직동에 필요한 전력을 공급하는 개체</i></summary>
					<p>파워(Power)는 각 부품에 전력을 공급하는 장치입니다. 컴퓨터의 심장이라고 불리는 만큼 파워는 내부 모든 요소에 전류를 공급하는 핵심 장비이기때문에 너무 저품질 파워를 사용하게될 경우 짧은 수명을 갖게될 수 밖에 없습니다.
					<br><br>추천브랜드<br><b>마이크로닉스 Classic II 600W</b></p>
			</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -c.jpg" alt="" /></a>
			<h2><b>쿨러</b></h2>
			<details>
					<summary><i>CPU 과열 방지, 케이스 내부 온도 조절</i></summary>
					<p>쿨러는 CPU작동 시 열을 식혀주는 역할을 합니다. 보통 냉각수 없는 공랭식이 사용되며, 요즘은 CPU 구매 시 번들로 함께 제공되는 기본 쿨러도 있습니다. 사무 환경에선 인텔 등의 번들 쿨러도 꽤 쓸만한 편이지만 고사양 게임을 위한 PC라면 별도의 고가 공랭식 쿨러,혹은 수랭식 쿨러를 쓰는 것이 좋습니다. 또 쿨러는 겉으로 보이는 팬의 작동 모습이나 소리 등을 통해 고장 유무가 쉽게 파악되는 부품 중 하나이며 쿨러가 고장나면 CPU에 발생하는 고열로 인해 PC가 쉽게 다운되곤 합니다.
					<br><br>추천모델<br><b>일반쿨러</b>: DEEPCOOL GAMER STORM ASSASSIN 3<br>
					<b>수랭쿨러</b>: NZXT KRAKEN X73</p>
			</details>
		</article>
		<article>
			<a href="#" class="image"><img src="assets/images/초급 -CASE.jpg" alt="" /></a>
			<h2><b>케이스</b></h2>
			<details>
				<summary><i>외관 디자인 담당 & 내부 보호</i></summary>
				<p>내부 부품을 한곳에 모아두는 박스입니다. 케이스 크기는 5가지로 다양한 가격대와 디자인 때문에 미들타워 케이스가 가장 대중적으로 쓰입니다. 사용용도/환경에 따라 케이스를 고르시면 되나 케이스는 저가형으로도 충분한 몫을 하는 하드웨어인 만큼 꼭 큰?비용을 투자할 필요는 없답니다.
				<br><br>사용범위<br><b>빅타워</b>: 시스템을 운영하거나 발열이 높은 고성능 시스템을 구성할 때 사용<br>
				<b>미들타워</b>: 가장 대중적으로 쓰이는 케이스<br>
				<b>준슬림</b>: 작은 공간 차지, 초슬림보다 넓은 확장성을 갖고있으나 좁은 공간으로 제한적<br>
				<b>미니타워</b>: 시디롬 가로 장착과 ATX파워 장착이 가능, 슬림형에 비해 공간이 넓어 확장에 용이<br>
				<b>초슬림</b>: 저전력/적은 공간 차지, 업그레이드가 불가능하며 일반 규격과는 다른 부품을 사용해야함</p>
			</details>
		</article>
	</div>
    </main>
    
  <div class="button-4" style="top: -20px; float:right; left: -100px;" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=wordmid'">
    <div class="eff-4"></div>
    <div class="no-drag">
    <a href="#"> 중급 ▶ </a>
			  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
  </div></div>
  
    <div class="clear"> 
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