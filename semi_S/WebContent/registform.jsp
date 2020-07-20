<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()=="" || doc.value==null) {
			alert("아이디를 입력해 주세요!");
		} else {
			var target = "login.do?command=idchk&id="+doc.value.trim();
			open(target,"","width=500, height=200");
		}
	}
	
	function idChkConfirm(){
		var chk=document.getElementsByName("id")[0].title;
		if(chk=="n"){
			alert("아이디 중복 체크를 먼저 해주세용~");
			document.getElementsByName("id")[0].focus();
		}
	}
	
	
</script>
<style type="text/css">
	.table_th{
		padding: 20px 30px;
		border-bottom: 1px solid;
		font-size: 20pt;
	}
	#registform{
		display: table;
		margin-left:auto;
		margin-right: auto;
	}
	
</style>
    
</head>

<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>
	
	<div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                            <h2>Log In</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
	<br>
	<form action="login.do" method="post" id="registform">
		<input type="hidden" name="command" value="regist">
		<div style="width: 400px;">
		
			<table border="1">
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id" title="n" required="required">
						<input type="button" value="id 중복 체크" onclick="idChk();">
					</td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="pw" 
									onclick="idChkConfirm();" required="required"></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" name="name" 
									onclick="idChkConfirm();" required="required"></td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="text" name="email" 
									onclick="idChkConfirm();" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입">
						
					</td>
				</tr>
			</table>
		</div>	
	</form>
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
</body>
</html>