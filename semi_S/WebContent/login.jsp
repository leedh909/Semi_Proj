<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<title> GRAPHCORE | 로그인 </title>
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
<script>
    $(document).ready(function(){
	    $('.eye i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	});
</script>

<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v7.0&appId=613300902645097&autoLogAppEvents=1" nonce="L9czDdZh"></script>

<script type="text/javascript">
	function statusChangeCallback(response) { 
	// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
	// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
		if (response.status === 'connected') { 
			// 페이스북을 통해서 로그인이 되어있다. 
			testAPI(); 
		}
	}
	
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '613300902645097',
	      cookie     : true,                     // Enable cookies to allow the server to access the session.
	      xfbml      : true,                     // Parse social plugins on this webpage.
	      version    : 'v7.0'           // Use this Graph API version for this call.
	    });
	
	
	    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
	    	
	    	statusChangeCallback(response);
	      	console.log(response);
	    });
	    
	};
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk')); 
	// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
	// 이 호출은 statusChangeCallback()에서 이루어진다. 
	
	function testAPI() {
		FB.api('/me',{"fields":"id,name,email"} , function(response) {
			console.log('Successful login for: '+ response.name);
			var id = response.id;
			var name = response.name;
         	var email = response.email;
         	console.log(id);
         	console.log(name);
         	console.log(email);
			FB.logout(function(response){});
         	location.href= '${pageContext.request.contextPath}/login.do?command=facebooklogin&id='+id+'&email='+email+'&name='+name;
		});
	}
	
</script>
<style type="text/css">
	.table_th{
		padding: 20px 30px;
		border-bottom: 1px solid;
		font-size: 20pt;
	}
	#loginform{
		display: table;
		margin-top: 30px;
		margin-left:auto;
		margin-right: auto;
		margin-bottom: 40px;
	}
	
	.id{
		width: 300px;
		height: 50px;
	}
	
	.pw{
		width: 300px;
		margin-top: 6px;
		height: 50px;
	}
	
	.btn1{
		width: 100%;
		text-align: center;
		background-color: #567;
		height: 50px;
		border-style: none;
		margin-top: 12px;
	}
	
	.btn2{
		border-style: none;
		background-color: #FFFFFF;
		float: right;
	}

	.button_base {
		margin-top: 12px;
		height: 50px;
		width: 100%;
	    border: 0;
	    position: relative;
    	box-sizing: border-box;
    	-webkit-box-sizing: border-box;
   		-moz-box-sizing: border-box;
    	-webkit-user-select: none;
    	cursor: default;
	}

	.b01_simple_rollover {
    	color: #ffffff;
    	padding: 10px;
    	background-color: #212529;
	}

	.b01_simple_rollover:hover {
    	color: #ffffff;
    	background-color: #FF1313;
	}

	.eye{
		position: relative;
	}
	
	.eye i{
    	position: absolute;
    	left: 87%;
    	top: 24px;
    	color: gray;
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
		
			<table >
				<col width="100"><col width="100">
				<tr>
					<td><input class="id" type="text" name="id" placeholder="아이디 입력" ></td>
				</tr>
				<tr>
					<td>
					<div class="eye">
					<input class="pw" type="password" name="pw" placeholder="비밀번호 입력">
					<i class="fa fa-eye fa-lg"></i>
					</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input style="cursor: pointer;" class="button_base b01_simple_rollover"  type="submit" value="login">
					</td>
				</tr>
				<tr>
					<td>	
						<input style="cursor: pointer;" class="btn2" type="button" value="회원가입"
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
			
			<!-- facebook login -->
			<div style="padding:5px; text-align: center;">
				<div class="fb-login-button" onlogin="checkLoginState();" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>
			</div>
			<br>
			<br>
						
	
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