<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> GRAPHCORE | Q&A </title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/logostyle.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
	.table_th{
		padding: 20px 30px;
		font-size: 20pt;
		text-align: center;
	}
	.boardtitle{
		color: blue;
	}
</style>
<%
	String id = String.valueOf(session.getAttribute("login"));
%>
</head>
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
    <!-- Preloader Start -->
    <div> 
		<jsp:include page="../header.jsp" />
	</div>
    <!-- header end -->
	

	<!-- Main -->
	<main>
	
	<!--? Hero Start -->
    <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                            <h2>QNA</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
	<div style="padding: 40px; padding-right: 200px;padding-left: 200px;">
	<form action="${pageContext.request.contextPath}/answer.do" method="post">
		<input type="hidden" name="command" value="qnawrite" >
		<table border="3">
			<tr>
				<th class="table_th">ID</th>
				<td><input type="text" name="id" value="<%=id%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th class="table_th">제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th class="table_th">내용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성" >
					<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</main>
	<div> 
		<jsp:include page="../footer.jsp" />
	</div>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->

    <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="${pageContext.request.contextPath}/assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>