<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	.table_th{
		padding: 20px 30px;
		border-bottom: 1px solid;
		font-size: 20pt;
	}
	#loginform{
		display: table;
		margin-top: 50px;
		margin-left:auto;
		margin-right: auto;
		margin-bottom: 30px;
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
	<form action="login.do" method="post" id="loginform">
		<input type="hidden" name="command" value="login">
		<div style="width: 300px;" id="logindiv">
		
			<table border="1">
				<col width="100"><col width="100">
				<tr>
					<th>I D</th>
					<td><input type="text" name="id" placeholder="id" ></td>
				</tr>
				<tr>
					<th>P W</th>
					<td><input type="password" name="pw" placeholder="pw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="login">
						<input type="button" value="regist"
									onclick="location.href='login.do?command=registform'">
					</td>
				</tr>
			</table>
			</div>
		</form>	
			<!-- kakao login -->
			<div style="padding:5px; text-align: center;">
			<a id="login-form-btn" href="javascript:loginFormWithKakao()">
			  <img
			    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
			    width="222"
			  />
			</a>
			</div>
			
			<!-- naver login -->
			<div style="padding:5px; text-align: center;">
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  				<div id="naverIdLogin"></div>
			</div>
				
		
	
	 <div> 
		<jsp:include page="footer.jsp" />
	</div>
	<!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

	<!-- naver JS -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "6HcRMEX_SvRjjW_I5EZz",
			callbackUrl: "http://localhost:8282/semi_S/navercallback2.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	</script>

    <!-- kakao JS -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	  // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
	  // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
	  Kakao.init('2db33b6d7020a1e6200dbb653c7c9cf7')
	  /* function loginWithKakao() {
        Kakao.Auth.authorize({
          // 초기화한 앱의 로그인 Redirect URI에 등록된 URI여야 합니다.
          redirectUri: 'http://localhost:8282/semi_S/header.jsp'
        })
      } */
	  function loginFormWithKakao() {
		  Kakao.Auth.loginForm({
		    	success: function(authObj){
		    		
		    		Kakao.API.request({
		   			 	url: '/v2/user/me',
		 	            success: function(res) {
		 	            	
		 	            	var id = res.id;
		 	            	var email = res.kakao_account["email"];
		 	            	var name = res.properties["nickname"];
		 	            	
/* 		 	            	alert(res.id);
		 	                alert(res.properties["nickname"]);
		 	                alert(res.kakao_account["email"]);
 */		 	                
		 	            	location.href= '${pageContext.request.contextPath}/login.do?command=kakaologin&id='+id+'&email='+email+'&name='+name;
		 	            	
		 	            }
		    		})
		    		/* console.log(authObj); */
		    		var token = authObj.access_token;
		    		
		    	},
		    	fail: function(err){
		    		alert(JSON.stringify(err));
		    	}
		    });
	  }
	  
	</script>
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