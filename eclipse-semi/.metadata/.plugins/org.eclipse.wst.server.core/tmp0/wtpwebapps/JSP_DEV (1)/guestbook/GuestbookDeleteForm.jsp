<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<html>
<head>
	<title>방명록 삭제</title>

	<style type="text/css">
		#wrap {
			width: 550px;
			text-align: center;
			margin: 0 auto 0 auto;
		}
		
		#deleteReplyForm{
			text-align: center;
		}
	</style>
	
	<script type="text/javascript">
	
		var httpRequest = null;
		
		// httpRequest 객체 생성
		function getXMLHttpRequest(){
			var httpRequest = null;
		
			if(window.ActiveXObject){
				try{
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
				} catch(e) {
					try{
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e2) { httpRequest = null; }
				}
			}
			else if(window.XMLHttpRequest){
				httpRequest = new window.XMLHttpRequest();
			}
			return httpRequest;	
		}
		
		// 비밀번호 미입력시 경고창
		function checkValue(){

			var form = document.forms[0];
			var num = form.guestbook_no.value;
			var pw = form.guestbook_password.value;
			
			if (!form.guestbook_password.value) {
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
			else // 비밀번호 입력시 Ajax를 이용해 삭제시도
			{
				var param="num="+num+"&pw="+pw;
				
				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = checkFunc;
				httpRequest.open("POST", "GuestbookDeleteAction.ge", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
				httpRequest.send(param);
			}
		}
		
		function checkFunc(){
			if(httpRequest.readyState == 4){
				// 결과값을 가져온다.
				var resultText = httpRequest.responseText;
				if(resultText == 0){
					alert("비밀번호가 틀립니다.");
				} 
				else{ // 비밀번호 일치시 삭제후 창을 닫는다.
					if (opener != null) {
						// 방명록(부모창) 새로고침
						window.opener.document.location.reload(); 
						opener.delForm = null;
				        self.close();
					}
				}
			}
		}
	</script>
	
</head>
<body>

<div id="wrap">
	<br>
	<b><font size="5" color="gray">삭제</font></b>
	<hr size="1" width="550">
	<br>

	<div id="deleteReplyForm">
		<form name="delGuestbook" target="parentForm">
			<input type="hidden" name="guestbook_no" value="${requestScope.guestbook_no}"/>
			비밀번호 :
			<input type="password" name="guestbook_password" maxlength="50">	
			<br><br><br>
			<input type="button" value="삭제" onclick="checkValue()">
			<input type="button" value="창닫기" onclick="window.close()">
		</form>
	</div>
</div>	

</body>
</html>