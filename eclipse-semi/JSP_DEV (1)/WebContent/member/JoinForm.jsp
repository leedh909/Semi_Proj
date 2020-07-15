<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>회원가입 화면</title>

	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>

	<script type="text/javascript">
	
		// 회원가입 화면의 입력값들을 검사한다.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.password.value != form.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!form.birthyy.value){
				alert("년도를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthyy.value)){
				alert("년도는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(form.birthmm.value == "00"){
				alert("월을 선택하세요.");
				return false;
			}
			
			if(!form.birthdd.value){
				alert("날짜를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthdd.value)){
				alert("날짜는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(!form.mail1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
			if(!form.address.value){
				alert("주소를 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="MainForm.do";
		}	
		
		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("member/IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">회원가입</font></b>
		<br><br><br>
		
		
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="MemberJoinAction.do" 
				name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>
						<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
						<input type="button" value="중복확인" onclick="openIdChk()">	
						<input type="hidden" name="idDuplication" value="idUncheck" >
					</td>
				</tr>
						
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="password" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">비밀번호 확인</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">이름</td>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">성별</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" >여
					</td>
				</tr>
					
				<tr>
					<td id="title">생일</td>
					<td>
						<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
						<select name="birthmm">
							<option value="00">월</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="phone"/>
					</td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td>
						<input type="text" size="50" name="address"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="가입"/>  
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>

</body>
</html>