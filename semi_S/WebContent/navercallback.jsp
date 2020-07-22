<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "6HcRMEX_SvRjjW_I5EZz",
				callbackUrl: "http://localhost:8282/semi_S/navercallback.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				
			}
		);

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var id = naverLogin.user.getId();
				var name = naverLogin.user.getName();
				var email = naverLogin.user.getEmail();
				alert(id);
				alert(name);
				alert(email);
				
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				if( name == undefined || name == null) {
					alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				
	
				window.location.replace("http://" + window.location.hostname + 
	                    ( (location.port==""||location.port==undefined)?"":":" + location.port) + "${pageContext.request.contextPath}/login.do?command=naverlogin&id="+id+"&email="+email+"&name="+name); 
	         } else {
	        	console.log(status);
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	</script>
</body>
</html>