<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("6HcRMEX_SvRjjW_I5EZz", "http://localhost:8282/semi_S/navercallback2.jsp");
  // 접근 토큰 값 출력
  //lert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
       
    var id = naver_id_login.getProfileData('id')
	var name = naver_id_login.getProfileData('name')
	var email = naver_id_login.getProfileData('email')
	
	/* console.log(naver_id_login);
    for( var key in naver_id_login){
    	console.log("key : " + key +", value : "+ naver_id_login[key]);
    } */

/* 	alert(id);
	alert(name);
	alert(email); */
	// https://nid.naver.com/nidlogin.logout 
	
	
	window.location.replace("http://" + window.location.hostname + 
            ( (location.port==""||location.port==undefined)?"":":" + location.port) + "${pageContext.request.contextPath}/login.do?command=naverlogin&id="+id+"&email="+email+"&name="+name);
	
	
	
  }
</script>
</body>
</html>
		