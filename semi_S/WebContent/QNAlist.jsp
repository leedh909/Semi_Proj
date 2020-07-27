<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="com.dto.AnswerDto" %>
<%@ page import="java.util.List" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> GRAPHCORE | Q&A </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script type="text/javascript">
	function idinput(num){
		if(num==1){
			alert("로그인 후 이용 가능합니다.")
		}else if(num==2){
			location.href="answer.do?command=qnawriteform";
		}
		
	}
</script>
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
<link rel="stylesheet" href="assets/css/table.css">
<link rel="stylesheet" href="assets/css/logostyle.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
	.table_th{
		padding: 20px 30px;
		border-bottom: 2px solid;
		font-size: 20pt;
		text-align: center;
	}
	a{
		color: blue;
		
	}
	.write{
		padding: 10px 20px;
		border-radius: 15px;
		background-color: gray;
		border:none;
	}
	
</style>
</head>
<%
	List<AnswerDto> list = (List<AnswerDto>)request.getAttribute("list");
    String id = String.valueOf(session.getAttribute("login"));
%>
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
    <br>
    <div style="padding:30px; height:800px; padding-right: 200px;padding-left: 200px;">
	<table border="5" >
		<col width="50px"><col width="100px">
	   <col width="300px"><col width="100px">
		<thead>
				<th class="table_th" width="73">No</th>
				<th class="table_th" width="65">작성자</th>
				<th class="table_th" width="134">제목</th>
				<th class="table_th" width="73">날짜</th>
				<th class="table_th" width="58">조회수</th>
			</thead>
		
		    <c:choose>
         <c:when test="${empty list }">
            <tr>
               <td colspan="5"> ======작성된 글이 없습니다.======</td>
            </tr>
         </c:when>
         
         <c:otherwise>
            <c:set var="qnanum" value="${fn:length(list) }"></c:set>
            <c:forEach var="dto" items="${list}">
               <tr>
                  <td style="text-align: center;"><c:out value="${qnanum }"></c:out> </td>
                  <td>${dto.id }</td>
                  <td>
                     <c:forEach begin="1" end="${dto.tabletab}" step="1">
                     </c:forEach>
                     <a href="${pageContext.request.contextPath}/answer.do?command=detail&qnanum=${dto.qnanum }">${dto.title }</a>
                  </td>
                  <td style="text-align: center;">${dto.regdate }</td>
                  <td style="text-align: center;">${dto.vcount }</td>
               </tr>
               <c:set var="qnanum" value="${qnanum -1}"></c:set>
            </c:forEach>
         </c:otherwise>
      </c:choose>
			<tr>
				<td colspan="5" align="right">
				
				<%
					System.out.println(session.getAttribute("login")); //로그인 사용자 확인용
					if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)){
				%>
					<button class="write" onclick="idinput(1);">글쓰기</button>
				<%
					}else{
				%>
					<button class="write" onclick="idinput(2);">글쓰기</button>
				<%		
					}
				%>
				</td>
			</tr>
		</table>
	</div>
	</main>
	</table>
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