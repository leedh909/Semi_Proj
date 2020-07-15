<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%
	// �ٹٲ� 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<html>
<head>
	<title>�� �󼼺���</title>
	
	<style type="text/css">
		#wrap {
			width: 800px;
			margin: 0 auto 0 auto;	
		}
	
		#detailBoard{
			text-align :center;
		}
		
		#title{
			height : 16;
			font-family :'����';
			font-size : 12;
			text-align :center;
			background-color: #F7F7F7;
		}
		
		#btn{
			font-family :'����';
			font-size : 14;
			text-align :center;
		}

	</style>
	
	<script type="text/javascript">
		function changeView(value)
		{
			if(value == 0)	
				location.href='BoardListAction.bo?page=${pageNum}';
			else if(value == 1)
				location.href='BoardReplyFormAction.bo?num=${board.board_num}&page=${pageNum}';
		}
		
		function doAction(value)
		{
			if(value == 0) // ����
				location.href="BoardUpdateFormAction.bo?num=${board.board_num}&page=${pageNum}";
			else if(value == 1) // ����
				location.href="BoardDeleteAction.bo?num=${board.board_num}";
		}
		

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
		
		// ��� ���
		function writeCmt()
		{
			var form = document.getElementById("writeCommentForm");
			
			var board = form.comment_board.value
			var id = form.comment_id.value
			var content = form.comment_content.value;
			
			if(!content)
			{
				alert("������ �Է��ϼ���.");
				return false;
			}
			else
			{	
				var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
					
				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = checkFunc;
				httpRequest.open("POST", "CommentWriteAction.co", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
				httpRequest.send(param);
			}
		}
		
		function checkFunc(){
			if(httpRequest.readyState == 4){
				// ������� �����´�.
				var resultText = httpRequest.responseText;
				if(resultText == 1){ 
					document.location.reload(); // �󼼺��� â ���ΰ�ħ
				}
			}
		}
		
		// ��� �亯â
		function cmReplyOpen(comment_num){
			var userId = '${sessionScope.sessionID}';
			
			if(userId == "" || userId == null){
				alert("�α����� ��밡���մϴ�.");
				return false;
			}
			else{
				// ��� �亯â open
				window.name = "parentForm";
				window.open("CommentReplyFormAction.co?num="+comment_num,
							"replyForm", "width=570, height=350, resizable = no, scrollbars = no");
			}
		}
		
		// ��� ����â
		function cmDeleteOpen(comment_num){
			var msg = confirm("����� �����մϴ�.");	
			if(msg == true){ // Ȯ���� �������
				deleteCmt(comment_num);
			}
			else{
				return false; // �������
			}
		}
	
		// ��� ����
		function deleteCmt(comment_num)
		{
			var param="comment_num="+comment_num;
			
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "CommentDeleteAction.co", true);	
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
			httpRequest.send(param);
		}
		
		// ��� ����â
		function cmUpdateOpen(comment_num){
			window.name = "parentForm";
			window.open("CommentUpdateFormAction.co?num="+comment_num,
						"updateForm", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
	</script>
</head>
<body>

<div id="wrap">
	<br><br>
	<div id="board">
		<table id="detailBoard" width="800" border="3" bordercolor="lightgray">
		
			<tr>
				<td id="title">�ۼ���</td>
				<td>${board.board_date}</td>
			</tr>
			<tr>
				<td id="title">�ۼ���</td>
				<td>${board.board_id}</td>
			</tr>
			<tr>
				<td id="title">
					�� ��
				</td>
				<td>
					${board.board_subject}
				</td>		
			</tr>
			<tr>
				<td id="title">
					�� ��
				</td>
				<td>
					${fn:replace(board.board_content, cn, br)}
				</td>		
			</tr>
			<tr>
				<td id="title">
					÷������
				</td>
				<td>
					<a href='FileDownloadAction.bo?file_name=${board.board_file}'>${board.board_file}</a>
				</td>	
			</tr>
	
			<tr align="center" valign="middle">
				<td colspan="5">
				<c:if test="${sessionScope.sessionID !=null}">
					<c:if test="${sessionScope.sessionID == board.board_id}">
						<input type="button" value="����" onclick="doAction(0)">
						<input type="button" value="����" onclick="doAction(1)">
					</c:if>
						<input type="button" value="���" onclick="changeView(1)" >
				</c:if>		
					<input type="button" value="���" onclick="changeView(0)">			
				</td> <!-- javascript:location.href='BoardListAction.bo?page=${pageNum}' -->
			</tr>
		</table>
	</div>
	<br><br>
	
	<!-- ��� �κ� -->
	<div id="comment">
		<table border="1" bordercolor="lightgray">
	<!-- ��� ��� -->	
	<c:if test="${requestScope.commentList != null}">
		<c:forEach var="comment" items="${requestScope.commentList}">
			<tr>
				<!-- ���̵�, �ۼ���¥ -->
				<td width="150">
					<div>
						<c:if test="${comment.comment_level > 1}">
							&nbsp;&nbsp;&nbsp;&nbsp; <!-- �亯���ϰ�� ���̵� �տ� ������ �ش�. -->
							<img src="img/reply_icon.gif">
						</c:if>
					
						${comment.comment_id}<br>
						<font size="2" color="lightgray">${comment.comment_date}</font>
					</div>
				</td>
				<!-- �������� -->
				<td width="550">
					<div class="text_wrapper">
						${fn:replace(comment.comment_content, cn, br)}
					</div>
				</td>
				<!-- ��ư -->
				<td width="100">
					<div  id="btn">
						<a href="#" onclick="cmReplyOpen(${comment.comment_num})">[�亯]</a><br>
					<!-- ��� �ۼ��ڸ� ����, ���� �����ϵ��� -->	
					<c:if test="${comment.comment_id == sessionScope.sessionID}">
						<a href="#" onclick="cmUpdateOpen(${comment.comment_num})">[����]</a><br>	
						<a href="#" onclick="cmDeleteOpen(${comment.comment_num})">[����]</a>
					</c:if>		
					</div>
				</td>
			</tr>
			
		</c:forEach>
	</c:if>
			
			<!-- �α��� ���� ��츸 ��� �ۼ����� -->
			<c:if test="${sessionScope.sessionID !=null}">
			<tr bgcolor="#F5F5F5">
			<form id="writeCommentForm">
				<input type="hidden" name="comment_board" value="${board.board_num}">
				<input type="hidden" name="comment_id" value="${sessionScope.sessionID}">
				<!-- ���̵�-->
				<td width="150">
					<div>
						${sessionScope.sessionID}
					</div>
				</td>
				<!-- ���� �ۼ�-->
				<td width="550">
					<div>
						<textarea name="comment_content" rows="4" cols="70" ></textarea>
					</div>
				</td>
				<!-- ��� ��� ��ư -->
				<td width="100">
					<div id="btn">
						<p><a href="#" onclick="writeCmt()">[��۵��]</a></p>	
					</div>
				</td>
			</form>
			</tr>
			</c:if>
	
		</table>
	</div>
</div>	

</body>
</html>