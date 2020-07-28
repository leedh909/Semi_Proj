<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.AnswerDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> COMQUEST | Q&A </title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

<!— CSS here —>
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
	#detailform {
		border:1px;
		display:table;
		margin-left:auto;
		margin-right:auto;
		text-align:left;
	}
	#titlesize {
		font-size:25px;
		font-weight:bolder;
	}
 	.table_th{
		padding: 10px 10px;
		font-size: 15pt;
		text-align:center;
	}
	
	.tr {
		background-color:none;
		border-top:1px solid;
		
	}
	#size2 {
		font-size:15px;
		resize:none; 
		border:none;
		padding-top:50px;
		text-align:center;
	}
	.set1{
		border-radius: 5px;
		background-color: skyblue;
		color:white;
		border:none;
		cursor:pointer;
	}
	.set2{
		border-radius: 5px;
		background-color: red;
		color:white;
		border:none;
		cursor:pointer;
	}
	.set3{
		border-radius: 5px;
		background-color: gray;
		color:white;
		border:none;
		cursor:pointer;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>
<%
       AnswerDto dto = (AnswerDto)request.getAttribute("dto");
       System.out.print(dto.toString());
       String id = String.valueOf(session.getAttribute("login"));

%>
</head>
<body>
	<!— ? Preloader Start —>
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
    <!— Preloader Start —>
    <div> 
		<jsp:include page="../header.jsp" />
	</div>
    <!— header end —>
	

	<!— Main —>
	<main>
	
	<!—? Hero Start —>
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
    <!— Hero End —>
<div style="padding: 30px;" id="detailform">

	<div class="tr">
	</div>
		<div class="table_th">
			<span id="titlesize">${dto.title }</span><br><br>
			<span id="size2" style="padding-left:10px;">${dto.id }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="size2">${dto.regdate }</span><br>
			<div class="tr" style="color:gray; opacity:0.5;">
			</div>
			<textarea id="size2" rows="10" cols="60" readonly="readonly">${dto.content }</textarea>
		</div>
	<div>
			<div align="right">	
			<br>			
				
				<%
					if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
				%>
					<input style="padding:5px 35px;" type="button" value="목록" class="set3" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">
				<%
					}else if(session.getAttribute("login").equals("ADMIN") ){
				%>
					<input style="padding:5px 20px;" class="set1" type="button" value="답글" onclick="location.href='${pageContext.request.contextPath}/answer.do?command=answerform&parentboardno=<%=dto.getQnanum()%>'">
					<input style="padding:5px 20px;" class="set2" type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/answer.do?command=delete&qnanum=<%=dto.getQnanum()%>'">
					<input style="padding:5px 20px;" class="set3" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">
				<%
					}else if(session.getAttribute("login").equals(dto.getId()) ){
				%>
				    <input style="padding:5px 20px;" class="set1" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/answer.do?command=updateform&qnanum=<%=dto.getQnanum()%>'">
					<input style="padding:5px 20px;" class="set2" type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/answer.do?command=delete&qnanum=<%=dto.getQnanum()%>'">
					<input style="padding:5px 20px;" class="set3" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">
				<%
					}else {
				%>
						<input type="button" value="목록" class="set3" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=QNAlist'">
				<%		
					}
				%>
		</div>
	</div>
</div>
</main>
	<div> 
		<jsp:include page="../footer.jsp" />
	</div>
    <!— Scroll Up —>
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!— JS here —>

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!— Jquery, Popper, Bootstrap —>
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!— Jquery Mobile Menu —>
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!— Jquery Slick , Owl-Carousel Plugins —>
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!— One Page, Animated-HeadLin —>
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!— Date Picker —>
    <script src="./assets/js/gijgo.min.js"></script>
    <!— Nice-select, sticky —>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    
    <!— counter , waypoint,Hover Direction —>
    <script src="./assets/js/jquery.counterup.min.js"></script>
    <script src="./assets/js/waypoints.min.js"></script>
    <script src="./assets/js/jquery.countdown.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>

    <!— contact js —>
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!— Jquery Plugins, main Jquery —>	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>