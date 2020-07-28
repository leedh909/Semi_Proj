<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title> COMQUEST | QNA </title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/gijgo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animated-headline.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/posts.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/logostyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/table.css">
</head>
<style type="text/css">

	#writeform {
		display:table;
		margin-left:auto;
		margin-right:auto;
	}
	
	
	.tr{
		padding: 10px 10px;
		font-size: 15pt;
		background-color:none;
		
	}
	
	#writer{
		text-size:20px;
		border:none;
		outline:none;
		background-color:none;
		
	}
	#size {
		font-size:25px;
	}
	#sub{
		border-radius: 5px;
		background-color: skyblue;
		border:none;
		color:white;
		cursor:pointer;
	}
	#cancel{
		border-radius: 5px;
		background-color: gray;
		border:none;
		color:white;
		cursor:pointer;
	}
</style>
<%
	String id = String.valueOf(session.getAttribute("login"));
%>
<body>
	<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/gcB.png" alt="">
                </div>
            </div>
        </div>
    </div>
	<div> 
		<jsp:include page="../header.jsp" />
	</div>
	<main>
	<!--? Hero Start -->
    <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                            <h2>Q&A</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="padding: 30px;">
	<form action="${pageContext.request.contextPath}/answer.do" method="post" id="writeform">
		<input type="hidden" name="command" value="qnawrite">
	
			<div class="tr">
				<div class="table_wr">
					<input id="writer" type="text" name="id" value="<%=id%>" readonly="readonly">
					<br>
				</div>
			</div>
			<div class="tr">
				<div>
					<input style="width:625px;" type="text" name="title"placeholder="제목을 입력해 주세요.">
					
				</div>
			</div>
			<div class="tr">
				<div>
					<textarea rows="10" cols="65" name="content" style="resize:none;"placeholder="내용을 입력해 주세요."></textarea>
				</div>
				</div>
			<div>
				<div align="right">	
				<br>	
					<input style="padding:5px 35px;" type="submit" value="작성" id="sub"> &nbsp;&nbsp;
					<input style="padding:5px 35px;" type="button" value="취소" id="cancel" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">					
				</div>
			</div>
		</div>
	</form>
	</main>
	<div> 
		<jsp:include page="../footer.jsp" />
	
	</div>
	<!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->

    <script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="../assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/animated.headline.js"></script>
    <script src="../assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="../assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="../assets/js/jquery.nice-select.min.js"></script>
    <script src="../assets/js/jquery.sticky.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.countdown.min.js"></script>
    <script src="../assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="../assets/js/contact.js"></script>
    <script src="../assets/js/jquery.form.js"></script>
    <script src="../assets/js/jquery.validate.min.js"></script>
    <script src="../assets/js/mail-script.js"></script>
    <script src="../assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!— Jquery Plugins, main Jquery —>	
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>