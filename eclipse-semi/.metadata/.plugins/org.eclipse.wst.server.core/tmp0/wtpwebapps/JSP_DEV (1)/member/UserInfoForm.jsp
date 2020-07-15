<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="jsp.member.model.MemberBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	// MemberInfoAction에서 넘긴 회원정보를 추출한다.
	//MemberBean member=(MemberBean)request.getAttribute("memberInfo");
%>

<html>
<head>
	<title>현재 유저정보 출력화면</title>
	
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
	
		function changeForm(val){
			if(val == "-1"){
				location.href="MainForm.do";
			}else if(val == "0"){
				location.href="MemberModifyFormAction.do";
			}else if(val == "1"){
				location.href="DeleteForm.do";
			}
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">내 정보</font></b>
		<br><br><br>
		
		<!-- 회원정보를 가져와 member 변수에 담는다. -->
		<c:set var="member" value="${requestScope.memberInfo}"/>
		
		<!-- 가져온 회원정보를 출력한다. -->
		<table>
			<tr>
				<td id="title">아이디</td>
				<td>${member.id}</td>
			</tr>
						
			<tr>
				<td id="title">비밀번호</td>
				<td>${member.password}</td>
			</tr>
					
			<tr>
				<td id="title">이름</td>
				<td>${member.name}</td>
			</tr>
					
			<tr>
				<td id="title">성별</td>
				<td>${member.gender}</td>
			</tr>
					
			<tr>
				<td id="title">생일</td>
				<td>
					${member.birthyy}년 
					${member.birthmm}월 
					${member.birthdd}일
				</td>
			</tr>
					
			<tr>
				<td id="title">이메일</td>
				<td>
					${member.mail1}@${member.mail2}
				</td>
			</tr>
					
			<tr>
				<td id="title">휴대전화</td>
				<td>${member.phone}</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>
					${member.address}
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="뒤로" onclick="changeForm(-1)">
		<input type="button" value="회원정보 변경" onclick="changeForm(0)">
		<input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>