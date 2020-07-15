<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
	<title>방명록 답변</title>
	
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
				alert("이름을 입력하세요.");
				return false;
			}
			else if(!form.guestbook_password.value)
			{
				alert("비밀번호를 입력하세요.");
				return false;
			}
			else if(!form.guestbook_content.value)
			{
				alert("내용을 입력하세요.");
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
	<b><font size="5" color="gray">답글</font></b>
	<hr size="1" width="550">
	<br>

	<!-- 답글 등록 부분 시작-->
	<div id="writeReplyForm">
		<form name="replyInfo" target="replyForm">
			<!-- 부모 방명록의 정보를 같이 전송한다. -->
			<input type="hidden" name="guestbook_no" value="${guestbook.guestbook_no}"/>
			<input type="hidden" name="guestbook_group" value="${guestbook.guestbook_group}"/>
			
			<table width="550">
				<tr>
					<td>이름 : </td>
					<!-- 로그인했을 경우 방명록의 이름 부분의 아이디를 세팅한다. -->
					<c:if test="${sessionScope.sessionID!=null}">
						<td>
							${sessionScope.sessionID}
							<input type="hidden" name="guestbook_id" value="${sessionScope.sessionID}">
						</td>
					</c:if>
					<c:if test="${sessionScope.sessionID==null}">
			 			<td><input type="text" name="guestbook_id"></td>
					</c:if>

					<td>비밀번호 : </td>
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
			<input type="button" value="등록" id="replyInsert" onclick="checkValue()">
			<input type="button" value="창닫기" onclick="window.close()">
		</form>
	</div>
	<!-- 답글 등록 부분 끝-->
</div>
</body>
</html>