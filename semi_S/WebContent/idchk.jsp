<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> GRAPHCORE | ID CHECK </title>
<script type="text/javascript">
	onload=function(){
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("id")[0].value = id;
	}
	function confirm(bool){
		if(bool==true){
			opener.document.getElementsByName("pw")[0].focus();
			opener.document.getElementsByName("id")[0].title="y";
		} else {
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	
	}
</script>
</head>
<%
	String idnotused = request.getParameter("idnotused");
	System.out.println("idnotused: "+idnotused); //확인용
%>
<body>
	<table width="400" height="130" align="center">
		<tr align="center">
			<td><input type="text" name="id"></td>
		</tr>
		<tr align="center">
			<td><%=idnotused.equals("true")?"아이디 생성 가능":"아이디가 이미 존재합니다" %></td>
		</tr>
		<tr align="center">
			<td>
				<input type="button" value="확인" onclick="confirm(<%=idnotused%>);">
			</td>
		</tr>
	</table>
</body>
</html>