<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="jsp.member.model.MemberBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	// MemberInfoAction���� �ѱ� ȸ�������� �����Ѵ�.
	//MemberBean member=(MemberBean)request.getAttribute("memberInfo");
%>

<html>
<head>
	<title>���� �������� ���ȭ��</title>
	
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
		<b><font size="6" color="gray">�� ����</font></b>
		<br><br><br>
		
		<!-- ȸ�������� ������ member ������ ��´�. -->
		<c:set var="member" value="${requestScope.memberInfo}"/>
		
		<!-- ������ ȸ�������� ����Ѵ�. -->
		<table>
			<tr>
				<td id="title">���̵�</td>
				<td>${member.id}</td>
			</tr>
						
			<tr>
				<td id="title">��й�ȣ</td>
				<td>${member.password}</td>
			</tr>
					
			<tr>
				<td id="title">�̸�</td>
				<td>${member.name}</td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td>${member.gender}</td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td>
					${member.birthyy}�� 
					${member.birthmm}�� 
					${member.birthdd}��
				</td>
			</tr>
					
			<tr>
				<td id="title">�̸���</td>
				<td>
					${member.mail1}@${member.mail2}
				</td>
			</tr>
					
			<tr>
				<td id="title">�޴���ȭ</td>
				<td>${member.phone}</td>
			</tr>
			<tr>
				<td id="title">�ּ�</td>
				<td>
					${member.address}
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="�ڷ�" onclick="changeForm(-1)">
		<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
		<input type="button" value="ȸ��Ż��" onclick="changeForm(1)">
</body>
</html>