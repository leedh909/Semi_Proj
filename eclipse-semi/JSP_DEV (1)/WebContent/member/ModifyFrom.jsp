<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<%@ page import="jsp.member.model.MemberBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>
<head>

	<title>ȸ������ ����ȭ��</title>
	
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
	
		function init(){
			setComboValue("${member.mail2}");
		}

		function setComboValue(val) 
		{
			var selectMail = document.getElementById('mail2'); // select ���̵� �����´�.
			for (i = 0, j = selectMail.length; i < j; i++)  // select �ϴ� option ����ŭ �ݺ��� ������.
			{
				if (selectMail.options[i].value == val)  // �ԷµȰ��� option�� value�� ������ ��
				{
					selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
					break;
				}
			}
		}
		
		// ��й�ȣ �Է¿��� üũ
		function checkValue() {
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
		}
		
	</script>
	
</head>
<body onload="init()">

		<br><br>
		<b><font size="6" color="gray">ȸ������ ����</font></b>
		<br><br><br>
		<!-- ȸ�������� ������ member ������ ��´�. -->
		<c:set var="member" value="${requestScope.memberInfo}"/>
		
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ��� -->
		<form method="post" action="MemberModifyAction.do" 
				name="userInfo" onsubmit="return checkValue()">
				
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td id="title">${member.id}</td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="password" maxlength="50" 
							value="${member.password}">
					</td>
				</tr>
			</table>	
			<br><br>	
			<table>

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
						<input type="text" name="mail1" maxlength="50" 
							value="${member.mail1}">
						@
						<select name="mail2" id="mail2">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net" >daum.net</option>
							<option value="nate.com">nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">�޴���ȭ</td>
					<td>
						<input type="text" name="phone" value="${member.phone}"/>
					</td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td>
						<input type="text" size="50" name="address"
							value="${member.address}"/>
					</td>
				</tr>
			</table>
			<br><br>
			<input type="button" value="���" onclick="javascript:window.location='MainForm.do'">
			<input type="submit" value="����"/>  
		</form>
		
</body>
</html>