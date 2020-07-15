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
	<title>����</title>
	
	<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
		
		#comment{
			text-align :left;
		}
		
		#listGuestForm{
			text-align :center;
			/*overflow:scroll; 
    		overflow-x:hidden; 
    		height:220px;*/
		}
		
		#writeGuestForm, #pageForm{
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		// �Է°� üũ
		function checkValue()
		{
			if(!document.guestbookInfo.guestbook_id.value){
				alert("�̸��� �Է��ϼ���.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_content.value){
				alert("������ �Է��ϼ���.");
				return false;
			}
		}
		
		// ���â open
		function openReplyForm(guestbook_no)
		{
			// window.name = "�θ�â �̸�"; 
			window.name = "replyForm";
			// window.open("open�� window", "�ڽ�â �̸�", "�˾�â �ɼ�");
			window.open("GuestbookReplyFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"rForm", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		// ����â open
		function openDelForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookDeleteFormAction.ge?num="+guestbook_no,
					"delForm", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		// ����â open
		function openUpdateForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookUpdateFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"updForm", "width=570, height=350, resizable = no, scrollbars = no");
		}

	</script>
		
</head>
<body>

	<br>
	<b><font size="5" color="gray">����</font></b>
	<hr size="1" width="700">
	<br>
	
<div id="wrap">	

	<!-- �� ��� �κ� ����-->
	<div id="writeGuestForm">
		<form name="guestbookInfo" method="post" action="GuestbookWriteAction.ge"
			onsubmit="return checkValue()" >
			<table width="700">
				<tr>
					<td>�̸� : </td>
					<!-- �α������� ��� ������ �̸� �κ��� ���̵� �����Ѵ� -->
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
						<textarea rows="7" cols="80" name="guestbook_content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="���">
		</form>
	</div>
	<!-- �� ��� �κ� ��-->

	<!-- �� ��� �κ� ���� -->
	<div id="listGuestForm">
		<form method="post" name="">
		
			<!-- ���� ���� �κ� -->
			<div id="comment">
				<c:forEach var="guestbook" items="${requestScope.list}">
					<hr size="1" width="700">		
					<c:if test="${guestbook.guestbook_level > 1}">
						<c:forEach begin="1" end="${guestbook.guestbook_level}">
							&nbsp;&nbsp; <!-- �亯���ϰ�� ���̵� �տ� ������ �ش�. -->
						</c:forEach>
						<img src="img/reply_icon.gif">
					</c:if>
					<label>${guestbook.guestbook_id}</label>&nbsp;&nbsp;&nbsp;
					<label>${guestbook.guestbook_date}&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<a href="#" onclick="openReplyForm(${guestbook.guestbook_no})">[�亯]</a>&nbsp;
					<a href="#" onclick="openUpdateForm(${guestbook.guestbook_no})">[����]</a>&nbsp;
					<a href="#" onclick="openDelForm(${guestbook.guestbook_no})">[����]</a><br>
				 	${fn:replace(guestbook.guestbook_content, cn, br)} <br>
				 </c:forEach>	
			 		<hr size="1" width="700">
			</div>
			 	
			<!-- ������ �κ� -->
		 	<div id="pageForm">
				<c:if test="${startPage != 1}">
					<a href='GuestbookListAction.ge?page=${startPage-1}'>[ ���� ]</a>
				</c:if>
				
				<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
					<c:if test="${pageNum == spage}">
						${pageNum}&nbsp;
					</c:if>
					<c:if test="${pageNum != spage}">
						<a href='GuestbookListAction.ge?page=${pageNum}'>${pageNum}&nbsp;</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage != maxPage }">
					<a href='GuestbookListAction.ge?page=${endPage+1 }'>[����]</a>
				</c:if>
			</div> 
		</form>
 	</div>
 	<!-- �� ��� �κ� �� -->

</div>
 	
</body>
</html>