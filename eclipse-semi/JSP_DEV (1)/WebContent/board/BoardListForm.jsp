<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<html>
<head>
	<title>��ü �Խñ�</title>
	
	<style type="text/css">
		#wrap {
			width: 800px;
			margin: 0 auto 0 auto;
		}

		#topForm{
			text-align :right;
		}

		#board, #pageForm, #searchForm{
			text-align :center;
		}
		
		#bList{
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		function writeForm(){
			location.href="BoardWriteForm.bo";
		}
	</script>
	
</head>
<body>	

<div id="wrap">

	<!-- �۸�� �� �κ�-->
	<br>
	<div id="topForm">
		<c:if test="${sessionScope.sessionID!=null}">
			<input type="button" value="�۾���" onclick="writeForm()">
		</c:if>	
	</div>
	
	<!-- �Խñ� ��� �κ� -->
	<br>
	<div id="board">
		<table id="bList" width="800" border="3" bordercolor="lightgray">
			<tr heigh="30">
				<td>�۹�ȣ</td>
				<td>����</td>
				<td>�ۼ���</td>
				<td>�ۼ���</td>
				<td>��ȸ��</td>
			</tr>
		<c:forEach var="board" items="${requestScope.list}">
			<tr>
				<td>${board.board_num}</td>
				<td align="left">
					<c:if test="${board.board_re_lev > 1}">
						<c:forEach begin="1" end="${board.board_re_lev}">
							&nbsp;&nbsp; <!-- �亯���ϰ�� �� ���� �տ� ������ �ش�. -->
						</c:forEach>
						<img src="img/reply_icon.gif">
					</c:if>
					<a href="BoardDetailAction.bo?num=${board.board_num}&pageNum=${spage}">
					${board.board_subject}
					</a>
				</td>
				<td>
					<a href="#">
					${board.board_id}
					</a>
				</td>
				<td>${board.board_date}</td>
				<td>${board.board_count}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<!-- ������ �ѹ� �κ� -->
	<br>
	<div id="pageForm">
		<c:if test="${startPage != 1}">
			<a href='BoardListAction.bo?page=${startPage-1}'>[ ���� ]</a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
			<c:if test="${pageNum == spage}">
				${pageNum}&nbsp;
			</c:if>
			<c:if test="${pageNum != spage}">
				<a href='BoardListAction.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage != maxPage }">
			<a href='BoardListAction.bo?page=${endPage+1 }'>[����]</a>
		</c:if>
	</div>
	
	<!--  �˻� �κ� -->
	<br>
	<div id="searchForm">
		<form>
			<select name="opt">
				<option value="0">����</option>
				<option value="1">����</option>
				<option value="2">����+����</option>
				<option value="3">�۾���</option>
			</select>
			<input type="text" size="20" name="condition"/>&nbsp;
			<input type="submit" value="�˻�"/>
		</form>	
	</div>
</div>	

</body>
</html>