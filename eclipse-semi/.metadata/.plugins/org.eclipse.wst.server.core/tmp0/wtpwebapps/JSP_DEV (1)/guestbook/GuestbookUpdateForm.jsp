<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
	<title>���� ����</title>
	
	<style type="text/css">
		#wrap {
			width: 550px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
	
		#pwCheckForm{
			display:block;  
		}
	
		#writeUpdateForm{
			text-align :center;
			display:none;
		}
	</style>
	
	<script type="text/javascript">
	
		var httpRequest = null;
		
		// httpRequest ��ü ����
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
		
		// ��й�ȣ ���Է½� ���â
		function checkValue(){

			var form = document.forms[0];
			var num = form.guestbook_no.value;
			var pw = form.guestbook_password.value;
			
			if (!pw) {
				alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
				return false;
			}
			else
			{
				var param="num="+num+"&pw="+pw;
				
				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = checkFunc;
				httpRequest.open("POST", "GuestbookPwCheckAction.ge", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
				httpRequest.send(param);
			}
		}
		
		function checkFunc(){
			if(httpRequest.readyState == 4){
				// ������� �����´�.
				var resultText = httpRequest.responseText;
				if(resultText == 0){
					alert("��й�ȣ�� Ʋ���ϴ�.");
				} 
				else if(resultText == 1){ 
					// ��й�ȣ ��ġ�� ���� ȭ���� ���̰� �Ѵ�.
					var chkForm = document.getElementById("pwCheckForm"); 
					var uForm = document.getElementById("writeUpdateForm"); 
					chkForm.style.display = 'none'; // ��й�ȣ �Է�ȭ�� - �Ⱥ��̰�
					uForm.style.display = 'block';	// ����ȭ�� - ���̰�
				}
			}
		}
		
		// ���� ����
		function update()
		{
			var form = document.forms[1];
			var id = form.guestbook_id.value;
			var content = form.guestbook_content.value;
			
			if(!id)
			{
				alert("�̸��� �Է��ϼ���.");
				return false;
			}
			else if(!content)
			{
				alert("������ �Է��ϼ���.");
				return false;
			}
			else
			{
				form.target = opener.name;
				form.method="post";
				form.action="GuestbookUpdateAction.ge?page=${pageNum}";
				form.submit();

				if (opener != null) {
                	opener.updForm = null;
                	self.close();
				}	
			}
		}
	</script>
	
</head>
<body>
<div id="wrap">
	<br>
	<b><font size="5" color="gray">����</font></b>
	<hr size="1" width="550">
	<br>

	<!-- ������ ��й�ȣ Ȯ�� -->
	<div id="pwCheckForm">
		<form name="delGuestbook" target="parentForm">
			<input type="hidden" name="guestbook_no" value="${guestbook.guestbook_no}"/>
			��й�ȣ :
			<input type="password" name="guestbook_password" maxlength="50">	
			<br><br><br>
			<input type="button" value="Ȯ��" onclick="checkValue()">
			<input type="button" value="â�ݱ�" onclick="window.close()">
		</form>
	</div>

	<!-- ���� ���� �κ� ����-->
	<div id="writeUpdateForm">
		<form name="updGuestbook" target="parentForm">
			<!-- ������ ������ ���� �����Ѵ�. -->
			<input type="hidden" name="guestbook_no" value="${guestbook.guestbook_no}"/>
			
			<table width="550">
				<tr>
					<!-- �α������� ��� ���� �̸� ���� �Ұ� -->
					<c:if test="${sessionScope.sessionID == guestbook.guestbook_id}">
						<td>
							�̸� : ${sessionScope.sessionID}
							<input type="hidden" name="guestbook_id" value="${sessionScope.sessionID}">
						</td>
					</c:if>
					
					<c:if test="${sessionScope.sessionID==null}">
			 			<td>�̸� : <input type="text" name="guestbook_id" value="${guestbook.guestbook_id}"></td>
					</c:if>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>
						<textarea rows="7" cols="70" name="guestbook_content">${guestbook.guestbook_content}</textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="����" onclick="update()">
			<input type="button" value="â�ݱ�" onclick="window.close()">
		</form>
	</div>
	<!-- ���� ���� �κ� ��-->
</div>
</body>
</html>