<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<%@ page import="com.mvc.dto.MVCBoardDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function allChk(bool){
		var chks = document.getElementsByName("chk");
		for(var i=0; i<chks.length; i++){
			chks[i].checked = bool;
		}
	}
	
	//체크를 하나도 안하면 submit 이벤트 취소
	$(function(){
		$("#muldelform").submit(function(){
			if($("#muldelform input:checked").length == 0){
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});
	});
</script>
<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<% List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("allList"); %>
<body>
	
<!-- Wrapper -->
			<div id="wrapper">
				<div id="main">
					
						<div class="inner">
						<!-- Main -->
							<h1>자유게시판</h1>
			
							<form action="mycontroller.jsp" method="post" id="muldelform">
								<input type="hidden" name="command" value="muldel">
								<table border="1">
									<col width="30px"><col width="50px"><col width="100px">
									<col width="300px"><col width="100px"> 
									<tr>
										<th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
										<th>NO</th>
										<th>WRITER</th>
										<th>TITLE</th>
										<th>DATE</th>
									</tr>
									<%
										if(list.size()==0){
									%>
										<tr>
											<td colspan="5">-----글이 존재하지 않습니다.-----</td>
										</tr>
									<%
										}else{
											for(MVCBoardDto dto:list){
									%>
											<tr>
												<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
												<td><%=dto.getSeq() %></td>
												<td><%=dto.getWriter() %></td>
												<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"> <%=dto.getTitle() %></a></td>
												<td><%=dto.getRegdate() %></td>
											</tr>
									<%
											}
										}
									%>
									<tr>
										<td colspan="5" align="right">
											<input type="submit" value="삭제" >
											<input type="button" value="글쓰기" onclick="location.href='mycontroller.jsp?command=boardinsertform'">
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<!-- <form method="post" action="#">
										<h2>로그인 넣을건가요??</h2>
										<input type="text" name="query" id="query" placeholder="Search" />
									</form> -->
									<img src="https://img.khan.co.kr/news/2019/11/29/l_2019112901003607500286631.jpg" alt="" width="330" height="300">
									
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.html">Homepage</a></li>
										<!-- <li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li> -->
										<li>
											<span class="opener">Tutorial</span>
											<ul>
												<li><a href="#">초금</a></li>
												<li><a href="#">중급</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">Guide</span>
											<ul>
												<li><a href="#">부품별 추천</a></li>
												<li><a href="#">가격비교</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">Community </span>
											<ul>
												<li><a href="#">Q&A</a></li>
												<li><a href="#">IT news</a></li>
												<li><a href="mycontroller.jsp?command=boardlist">자유게시판</a></li>
											</ul>
										</li>
										<li><a href="#">Quiz</a></li>
									</ul>
								</nav>

							<!-- Section -->
							

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">조장@naver.com</a></li>
										<li class="fa-phone">(010) 1234-1234</li>
										<li class="fa-home">KH정보교육원<br />
										강남역이랑 역삼역 사이</li>
									</ul>
								</section>

						</div>
					</div>

			</div>

</body>
</html>