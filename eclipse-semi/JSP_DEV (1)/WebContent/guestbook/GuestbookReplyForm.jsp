<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
	<title>���� �亯</title>
	
	<style type="text/css">
		#wrap {
			width: 550px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
	
		#writeReplyForm{
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		function checkValue(){
			var form = document.forms[0];

			if(!form.guestbook_id.value)
			{
				alert("�̸��� �Է��ϼ���.");
				return false;
			}
			else if(!form.guestbook_password.value)
			{
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			else if(!form.guestbook_content.value)
			{
				alert("������ �Է��ϼ���.");
				return false;
			}
			else
			{
				form.target = opener.name;
				form.method="post";
				form.action="GuestbookReplyAction.ge?page=${pageNum}";
				form.submit();

				if (opener != null) {
                	opener.rForm = null;
                	self.close();
				}
			}
		}
	</script>
	
</head>
<body>
<div id="wrap">
	<br>
	<b><font size="5" color="gray">���</font></b>
	<hr size="1" width="550">
	<br>

	<!-- ��� ��� �κ� ����-->
	<div id="writeReplyForm">
		<form name="replyInfo" target="replyForm">
			<!-- �θ� ������ ������ ���� �����Ѵ�. -->
			<input type="hidden" name="guestbook_no" value="${guestbook.guestbook_no}"/>
			<input type="hidden" name="guestbook_group" value="${guestbook.guestbook_group}"/>
			
			<table width="550">
				<tr>
					<td>�̸� : </td>
					<!-- �α������� ��� ������ �̸� �κ��� ���̵� �����Ѵ�. -->
					<c:if test="${sessionScope.sessionID!=null}">
						<td>
							${sessionScope.sessionID}
							<input type="hidden" name="guestbook_id" value="${sessionScope.sessionID}">
						</td>
					</c:if>
					<c:if test="${sessionScope.sessionID==null}">
			 			<td><input type="text" name="guestbook_id"></td>
					</c:if>

					<td>��й�ȣ : </td>
					<td><input type="password" name="guestbook_password"></td>
				</tr>
				<tr><td colspan="4">&nbsp;</td></tr>
				<tr>
					<td colspan="4">
						<textarea rows="7" cols="70" name="guestbook_content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="���" id="replyInsert" onclick="checkValue()">
			<input type="button" value="â�ݱ�" onclick="window.close()">
		</form>
	</div>
	<!-- ��� ��� �κ� ��-->
</div>
</body>
</html>