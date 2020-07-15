<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#yes{
		width: 200px;
		height: 100px;
		font-size: 30px;
		position: absolute;
		left : 24%;
		top: 65%;
		
	}
	#no{
		width: 200px;
		height: 100px;
		font-size: 30px;
		position: absolute;
		left : 39%;
		top: 65%;
		
	}
	#bac{
		width: 100%;
		height: 1000px;
	}
	h1{
		position : absolute;
		left : 20%;
		top: 20%;
		font-size: 100px;
	}
	
	
	

</style>
</head>
<body>
	<div id="bac"  style="background-size:100% 100%;  background-image: url('https://t1.daumcdn.net/cfile/tistory/1569A8335153A81328')">
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;당신은<br> 컴잘알 입니까??</h1>
		<button id="yes" onclick="location.href='index.html'">YES</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id="no"onclick="location.href='index.html'">NO</button>
	</div>
</body>
</html>