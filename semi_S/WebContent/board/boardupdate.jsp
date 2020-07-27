<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.BoardDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> GRAPHCORE | 자유게시판 </title>
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
<%
	BoardDto dto = (BoardDto)request.getAttribute("dto");
	System.out.print("update: "+dto.toString());

%>
<style type="text/css">
	.table_th{
		padding: 20px 30px;
		font-size: 20pt;
	}
</style>
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
                            <h2>자유게시판-글 수정</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div style="padding: 40px; padding-right: 200px;padding-left: 200px;">
	<form action="BoardController2" method="post">
		<input type="hidden" name="command" value="boardupdate">
		<input type="hidden" name="seq" value="${dto.seq }">
	<table border="3" >
		<col width="100px"><col width="100%">
		 
		<tr>
			<th class="table_th">NO</th>
			<td>${dto.seq}</td>
		</tr>
		<tr>
			<th class="table_th">DATE</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th class="table_th">WRITER</th>
			<td>${dto.writer}</td>
		</tr>
		<tr>
			<th class="table_th">TITLE</th>
			<td><input type="text" name="title" value="${dto.title }"></td>
		</tr>
		<tr>
			<th class="table_th">내용</th>
			<td><textarea rows="20" cols="100" name="content">${dto.content }</textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="수정완료" >
				<input type="button" value="취소" onclick="location.href='BoardController2?command=detail&seq=${dto.seq}'">				
			</td>
		</tr>
	</table>
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