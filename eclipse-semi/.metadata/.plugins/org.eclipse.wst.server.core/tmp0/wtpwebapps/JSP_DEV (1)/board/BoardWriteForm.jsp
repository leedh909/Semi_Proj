<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>게시판 - 글쓰기</title>
	
	<style type="text/css">
		#title{
			height : 16;
			font-family :'돋움';
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
				alert("제목을 입력해주세요.")
				return false;
			}
			else if(!board_content){
				alert("내용을 입력해주세요.")
				return false;
			}
		}
	
	</script>
	
</head>
<body>

	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>
	
	<form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data"
		onsubmit="return checkValue()">
	<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
	<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td id="title">작성자</td>
			<td>${sessionScope.sessionID}</td>
		</tr>
			<tr>
			<td id="title">
				제 목
			</td>
			<td>
				<input name="board_subject" type="text" size="70" maxlength="100" value=""/>
			</td>		
		</tr>
		<tr>
			<td id="title">
				내 용
			</td>
			<td>
				<textarea name="board_content" cols="72" rows="20"></textarea>			
			</td>		
		</tr>
		<tr>
			<td id="title">
				파일첨부
			</td>
			<td>
				<input type="file" name="board_file" />
			</td>	
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="reset" value="작성취소" >
				<input type="submit" value="등록" >
				<input type="button" value="목록" >			
			</td>
		</tr>
	</table>	
	</form>
	
</body>
</html>