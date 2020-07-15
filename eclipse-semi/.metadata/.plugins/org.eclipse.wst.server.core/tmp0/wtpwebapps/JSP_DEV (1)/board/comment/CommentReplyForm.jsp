<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title> ��� �亯 </title>
	
	<style type="text/css">
		#wrap {
			width: 550px;
			margin: 0 auto 0 auto;
			text-align :center;
		}
	
		#commentReplyForm{
			text-align :center;
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
	
	
		function checkValue()
		{
			var form = document.forms[0];
			// ������ ���� ������ ��´�.	
			var comment_num = "${comment.comment_num}";
			var comment_board = "${comment.comment_board}";
			var comment_id = "${sessionScope.sessionID}";
			var comment_content = form.comment_content.value
			
			if(!comment_content)
			{
				alert("������ �Է��ϼ���");
				return false;
			}
			else{
				var param="comment_num="+comment_num+"&comment_board="+comment_board
								+"&comment_id="+comment_id+"&comment_content="+comment_content;

				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = checkFunc;
				httpRequest.open("POST", "CommentReplyAction.co", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
				httpRequest.send(param);
			}
		}
		
		function checkFunc(){
			if(httpRequest.readyState == 4){
				// ������� �����´�.
				var resultText = httpRequest.responseText;
				if(resultText == 1){
					if (opener != null) {
						// �θ�â ���ΰ�ħ
						window.opener.document.location.reload(); 
						opener.replyForm = null;
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
	<b><font size="5" color="gray">��� �亯</font></b>
	<hr size="1" width="550">
	<br>

	<div id="commentReplyForm">
		<form name="replyInfo" target="parentForm">		
			<textarea rows="7" cols="70" name="comment_content"></textarea>
			<br><br>
			<input type="button" value="���" onclick="checkValue()">
			<input type="button" value="â�ݱ�" onclick="window.close()">
		</form>
	</div>
</div>	
</body>
</html>