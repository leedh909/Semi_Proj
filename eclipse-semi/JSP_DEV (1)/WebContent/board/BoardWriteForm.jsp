<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>�Խ��� - �۾���</title>
	
	<style type="text/css">
		#title{
			height : 16;
			font-family :'����';
			font-size : 12;
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		function checkValue(){
			var form = document.forms[0];
			var board_subject = form.board_subject.value;
			var board_content = form.board_content.value;
			
			if(!board_subject){
				alert("������ �Է����ּ���.")
				return false;
			}
			else if(!board_content){
				alert("������ �Է����ּ���.")
				return false;
			}
		}
	
	</script>
	
</head>
<body>

	<br>
	<b><font size="6" color="gray">�۾���</font></b>
	<br>
	
	<form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data"
		onsubmit="return checkValue()">
	<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
	<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td id="title">�ۼ���</td>
			<td>${sessionScope.sessionID}</td>
		</tr>
			<tr>
			<td id="title">
				�� ��
			</td>
			<td>
				<input name="board_subject" type="text" size="70" maxlength="100" value=""/>
			</td>		
		</tr>
		<tr>
			<td id="title">
				�� ��
			</td>
			<td>
				<textarea name="board_content" cols="72" rows="20"></textarea>			
			</td>		
		</tr>
		<tr>
			<td id="title">
				����÷��
			</td>
			<td>
				<input type="file" name="board_file" />
			</td>	
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="reset" value="�ۼ����" >
				<input type="submit" value="���" >
				<input type="button" value="���" >			
			</td>
		</tr>
	</table>	
	</form>
	
</body>
</html>